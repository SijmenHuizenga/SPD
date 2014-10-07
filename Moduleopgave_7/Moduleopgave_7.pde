
String fileName = "cijfers_groot.txt";

int grafiekHoogte = 270;
int grafiekBreedte = 360;
int grafiekX = 20;
int grafiekY = 100;
float grafiekFactor =1.5;

void setup(){
  //stap 1
  String[] lines = loadStrings(fileName);
  float[] cijfers = toFloatArr(lines);
  
  //stap 2
  int aantalCijfers = cijfers.length;
  float maxCijfer = getMax(cijfers);
  float minCijfer = getMin(cijfers);
  float avg = getAvg(cijfers);
  int vold = getVoldoendes(cijfers);
  int onvold = getOnvoldoendes(cijfers);
  
  String statestiekText = "\n\r";
  statestiekText += "aantal cijfers: " + aantalCijfers + "\n\r";
  statestiekText += "Hoogste cijfer: " + maxCijfer + "\n\r";
  statestiekText += "Laagste cijfer: " + minCijfer + "\n\r";
  statestiekText += "Gemiddelde: " + avg + "\n\r";
  statestiekText += "Aantal voldoende: " + vold + "\n\r";
  statestiekText += "Aantal onvoldoende: " + onvold + "\n\r";
  
  println(statestiekText);
  
  //stap 3
  int[] balken = new int[10];
  balken[0] = countBetween(cijfers, -1, 1);
  for(int i = 1; i < balken.length; i++){
    balken[i] = countBetween(cijfers, i, i+1);
  }
  
  //stap 4
  size(400, 400);
  background(0);
  fill(255);
  text(statestiekText, 20, 5);
  
  fill(150);
  rect(grafiekX, grafiekY, grafiekBreedte, grafiekHoogte);
  
  int balkBreedte = grafiekBreedte/10;
  for(int i = 0; i <= 10; i++)
    text(i + ",0", grafiekX+balkBreedte*i-10, grafiekY + grafiekHoogte+10);
  fill(255);
  stroke(0);
  for(int i = 0; i < balken.length; i++){
    rect(grafiekX + i*balkBreedte, grafiekY+grafiekHoogte-(balken[i]*grafiekFactor), balkBreedte, balken[i]*grafiekFactor);
  }
}



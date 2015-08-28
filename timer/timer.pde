int startH, startM, startS;
String end = null;

void setup(){
  startS = second();
  startM = minute();
  startH = hour(); 
  textSize(100);
  size(500, 130);
  frame.setAlwaysOnTop(true);
}

void draw() {
  background(0);
  color(255);
  if(end == null){
    text(getTime(), 30, 100);
  }else{
    text(end, 30, 100);
  }
}

int getTime(){
    int s = second() - startS;
    int m = minute() - startM;
    int h = hour() - startH;
    return s + m*60 + h*60*60;
}

void mousePressed(){
  if(end == null)
    end = ""+getTime();
}

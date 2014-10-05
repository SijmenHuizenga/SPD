PImage jonge;
PImage meisje;

int imgHeight = 50;
int imgWidht = 35;
int curRow = 0;

void drawRow(int startY){
  int kindAmount = 0;

  boolean lastPersonMale = false;
  while(lastPersonMale == false){
     if(random(2) < 1){
        lastPersonMale = false;   //maak een meisje
        image(meisje, kindAmount * imgWidht, startY);
     }else{
        lastPersonMale = true;    //maak een jongen
        image(jonge, kindAmount * imgWidht, startY);
     }
     kindAmount++;
  } 
}
void setup(){
  jonge = loadImage("jonge.png");
  meisje = loadImage("meisje.png");
  size(600, 300);
  while( curRow*imgHeight < height ){
      drawRow(curRow*imgHeight);
      curRow ++;
  }
}

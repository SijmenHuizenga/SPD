int  GEEL  =  #FFDA05;
int  BLAUW  =  #256CE3;
void setup(){
  size(600, 600);
}

void draw(){
 background(BLAUW);
 fill(GEEL);
 noStroke();
 
 ellipse(width/2, height/2, width/4*3, width/4*3);
 stroke(GEEL);
 line(0, 0, width-1, height-1);//
 line(0, height-1, width-1, 0);//
 line(0, height/2, width-1, height/2);
 line(width / 2, 0, width / 2, height-1); 
}

int marge = 50;

void setup(){
   size(500, 500); 
}

int balkHoogte = 0;
void draw(){
  background(0);
  fill(255, 0, 255);
  rect(marge, height-balkHoogte, width-2*marge, balkHoogte);
  println(balkHoogte);
  balkHoogte++;
}

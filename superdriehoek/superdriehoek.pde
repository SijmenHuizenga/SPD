int marge = 50;
void setup(){
  size(400, 400);
  frame.setResizable(true);
}
void draw(){
  int x1 = width/2;
  int y1 = marge;
  int x2 = marge;
  int y2 = height-1-marge;
  int x3 = width-1-marge;
  int y3 = height-1-marge;
  background(100);
  fill(255);
  stroke(0);
  triangle(x1, y1, x2, y2, x3, y3);
  
  int driehoekH = height-1-2*marge;
  int driehoekW = width-1-2*marge;
  
  int kx1 = marge+driehoekW/4;
  int ky1 = marge+driehoekH/2;
  int kx2 = width-(marge+driehoekW/4);
  int ky2 = ky1;
  int kx3 = width/2;
  int ky3 = height-1-marge;
  triangle(kx1, ky1, kx2, ky2, kx3, ky3);
}

import processing.video.*; 
Capture cam; 
 
PApplet t = this;
void setup() { 
  size(200, 200); 
  cam = new Capture(this);
  cam.start();
  frame.setResizable(true); 
} 
 
void draw() { 
  if (cam.available()) { 
    // Reads the new frame
    cam.read(); 
  } 
  image(cam, 0, 0); 
}

import controlP5.*;
ControlP5 theControl;

void setup() {
  size(600, 800);
  theControl = new ControlP5(this);
  createNumberBoxes(theControl);
}

void draw() {
  float lengte = leesLengte()/100;
  float gewicht = leesGewicht();
  
  float bmp = gewicht / (lengte*lengte);
  
  float schermFactor = 8;
  
  float ondergewicht = 18.5;
  float normaalgewicht = 25.0;
  float overgewicht = 30;
  
  background(0, 0, 0);
  stroke(255, 255, 255);
  fill(255, 255, 255);
  textSize(15);
  text("Ondergewicht", 5, height-ondergewicht*schermFactor+15);
  line(0, height-ondergewicht*schermFactor, width, height-ondergewicht*schermFactor);
  
  text("Normaal Gewicht", 5, height-ondergewicht*schermFactor-5);
  line(0, height-normaalgewicht*schermFactor, width, height-normaalgewicht*schermFactor);
  text("Overgewicht", 5, height-normaalgewicht*schermFactor-5);
  
  text("Obese",  5,  height-overgewicht*schermFactor-5);
  line(0, height-overgewicht*schermFactor, width, height-overgewicht*schermFactor);
  
  fill(255, 0, 0);
  rect(width/3, height-bmp*schermFactor, width/3, bmp*schermFactor);  
}


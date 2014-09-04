import controlP5.*;
ControlP5 theControl;

void setup() {
  size(400, 350);
  theControl = new ControlP5(this);
  createNumberBoxes(theControl);
}

void draw() {
  println("lengte:" + leesLengte());
  println("gewicht: " + leesGewicht());
}


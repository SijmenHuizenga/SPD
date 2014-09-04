Numberbox nb1, nb2;

/**
  Creates the two input fields   
*/
void createNumberBoxes(ControlP5 controlP5) {
  nb1 = controlP5.addNumberbox("lengte (cm)     ", 170, 100, 10, 100, 30);
  nb1.valueLabel().setFont(ControlP5.grixel);
  nb1.setMax(250);
  nb1.setMin(50);
  nb1.captionLabel().setFont(ControlP5.grixel);
  
  nb2 = controlP5.addNumberbox("gewicht (kg)      ", 60, 100, 70, 100, 30);
  nb2.valueLabel().setFont(ControlP5.grixel);
  nb2.captionLabel().setFont(ControlP5.grixel);
  
  nb2.setMax(200);
  nb2.setMin(10);
}

/**
  Returns the length in cm  
*/
float leesLengte() {
  return nb1.value();
}

/**
  Returns the weight in kg
*/
float leesGewicht() { 
  return nb2.value();
}


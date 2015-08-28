float berekenBMI(){
  float lengte = sldr1Value/100;
  float gewicht = sldr2Value;
  
  return gewicht / (lengte*lengte);
}

void tekenBMILegenda(){
  stroke(255, 255, 255);
  textSize(15);
  text("Ondergewicht", 5, height-ondergewicht*schermFactor+15);
  line(0, height-ondergewicht*schermFactor, width, height-ondergewicht*schermFactor);
  
  text("Normaal Gewicht", 5, height-ondergewicht*schermFactor-5);
  line(0, height-normaalgewicht*schermFactor, width, height-normaalgewicht*schermFactor);
  text("Overgewicht", 5, height-normaalgewicht*schermFactor-5);
  
  text("Obese",  5,  height-overgewicht*schermFactor-5);
  line(0, height-overgewicht*schermFactor, width, height-overgewicht*schermFactor);
}

void tekenBMIBalk(){
  float bmi = berekenBMI();
  if(bmi < ondergewicht){
    fill(255, 106, 0);
  }else if(bmi < normaalgewicht){
    fill(0, 255, 0);
  }else if(bmi < overgewicht){
    fill(255, 106, 0);
  }else{
    fill(255, 0, 0);
  }
  stroke(255, 255, 255);
  
  int balkHoogte = (int)constrain(bmi*schermFactor, 0, height);
  rect(width/3, height-balkHoogte, width/3, balkHoogte); 
}

void tekenSlider(int x, int y, int w, int h, float v, float min, float max, String text){
  fill(sldrBgColor);
  stroke(sldrStrokeColor);
  
  rect(x-(sldrHolderWidth/2), y, w+sldrHolderWidth, h);

  fill(sldrHolderColor);
  rect(getSliderHolderX(x, w, v, min, max), y, sldrHolderWidth, h);
  
  textSize(15);
  fill(sldrTextColor);
  text(text + v, x, y-5);
}

//returnt de x positie van de slider holder.
int getSliderHolderX(int x, int w, float v, float min, float max){
  float persentageFilled = (v-min) / (max-min);
  return (int) (x + (w*persentageFilled) - (sldrHolderWidth/2));
}

void onPossibleBarPress(int x, int y, int w, int h, float v, float min, float max, int sldrNr){
  int holderX = getSliderHolderX(x, w, v, min, max);
  if(mouseX > holderX && mouseX < holderX+sldrHolderWidth && mouseY > y && mouseY <  y + h){
     sldrSelectedNr = sldrNr;
     sldrSelectedOffset = mouseX - holderX - (sldrHolderWidth/2);
  }
}
/**
* Op het moment dat een holder is vastgepakt, en de muis beweegt, dan kan met deze functie
* het nieuwe value berekent worden.
*/
float onBarDrag(int x, int w, float min, float max){
  float newPersentageFilled = (mouseX-x - sldrSelectedOffset) / (float)w;
  return newPersentageFilled * (max-min) + min;
}

void mousePressed(){
  onPossibleBarPress(sldr1X, sldr1Y, sldr1Width, sldr1Height, sldr1Value, sldr1Min, sldr1Max, 1);
  onPossibleBarPress(sldr2X, sldr2Y, sldr2Width, sldr2Height, sldr2Value, sldr2Min, sldr2Max, 2);
}

void mouseReleased(){
  sldrSelectedNr = -1;
}

void mouseDragged(){
  switch(sldrSelectedNr){
     case 1: 
       sldr1Value = constrain(onBarDrag(sldr1X, sldr1Width, sldr1Min, sldr1Max), sldr1Min, sldr1Max);
       break;
     case 2: 
       sldr2Value = constrain(onBarDrag(sldr2X, sldr2Width, sldr2Min, sldr2Max), sldr2Min, sldr2Max); 
       break;
  }
}


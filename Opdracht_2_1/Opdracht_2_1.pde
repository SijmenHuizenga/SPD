void setup(){
  int breedte = 999999;
  int minBreedte = 200;
  int maxBreedte = 1200;
  
  breedte = constrain(breedte, minBreedte, maxBreedte);
  if(breedte % 2 == 0)
      breedte++;
  int hoogte = breedte/2;
  
  if(hoogte % 2 == 0)
      hoogte++;
  
  size(breedte, hoogte);
 
  line(width/2, 0, width/2, height-1);
  line(0, height/2, width-1, height/2);
  
  //opgave 2.2
  noFill();
  rect(0, 0, width-1, height-1);
  
  //opgave 2.3
  noStroke();
  
  int boxW = width/2-1;
  int boxH = height/2-1;
  
  fill(255, 0, 0);//linksboven
  rect(1, 1, boxW, boxH);
  
  fill(0, 255, 255);//linksonder
  rect(1, boxH+2, boxW, boxH);
  
  fill(255, 255, 0);//rechtsboven
  rect(boxW+2, 1, boxW, boxH);
  
  fill(255, 0, 255);//rechtsonder
  rect(boxW+2, boxH+2, boxW, boxH);
}

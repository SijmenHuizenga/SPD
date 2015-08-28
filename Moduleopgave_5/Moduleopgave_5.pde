
//sldr = slider
int sldrBgColor = color(255, 0, 0);
int sldrHolderColor = color(0, 255, 0);
int sldrHolderWidth = 15;
int sldrStrokeColor = color(150, 150, 150);
int sldrTextColor = color(255, 255, 255);

//slider1 = lengte in cm
String sldr1Txt = "Lengte in cm: ";
int sldr1X = 50, sldr1Y = 50, sldr1Width = 500, sldr1Height = 50; 
float sldr1Value = 160, sldr1Min = 50, sldr1Max = 250;

//slider2 = gewicht in kilo's
String sldr2Txt = "Gewicht in kilo's: ";
int sldr2X = 50, sldr2Y = 150, sldr2Width = 500, sldr2Height = 50;
float sldr2Value = 60, sldr2Min = 10, sldr2Max = 200;

//de slider die op dit moment wordt vast gehouden door de user.
// -1 betekent niet vast gehouden.
int sldrSelectedNr = -1;
//als het schuifje wordt vastgepakt, geeft deze variable aan wat de
// x-offset is tussen de linkerkant van het balkje en de muis.
int sldrSelectedOffset = 0;

//voor de horizontale lijntjes
float ondergewicht = 18.5;
float normaalgewicht = 25.0;
float overgewicht = 30;

//vergrotingsfactor in de hoogte;
int schermFactor = 15;

void setup() {
  size(600, 800);
}

void draw() {
  background(0, 0, 0); 
  
  tekenBMILegenda();
  tekenBMIBalk();
  
  tekenSlider(sldr1X, sldr1Y, sldr1Width, sldr1Height, sldr1Value, sldr1Min, sldr1Max, sldr1Txt);
  tekenSlider(sldr2X, sldr2Y, sldr2Width, sldr2Height, sldr2Value, sldr2Min, sldr2Max, sldr2Txt);
}

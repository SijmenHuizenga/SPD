public Staaf[] stafen;
public int tussenAfstand;
public int aantalStreepjes;
void setup(){
  frame.setResizable(true);
  
  size(500, 600);
  
   stafen = new Staaf[]{
    new Staaf(100, "Koekjes", color(255, 0, 0)),
    new Staaf(200, "Stroopwafels", color(0, 255, 0)),
    new Staaf(900, "Cupcakes", color(0, 0, 255))
  };
  
  tussenAfstand = 50;
  aantalStreepjes = 18;
}

void draw(){
  
  int hoogsteStaaf = 0;
  for(Staaf staaf : stafen){
      if(staaf.hoogte > hoogsteStaaf)
          hoogsteStaaf = staaf.hoogte;
  }
  float vergrotingsfactor = (height*0.75) / hoogsteStaaf;
  int staafBreedte = (width-tussenAfstand) / stafen.length - tussenAfstand;
  int tussenStreepjes = height/aantalStreepjes;
  
  background(255, 255, 255);

  
  int i = 0;

  for(Staaf staaf : stafen){
      fill(staaf.kleur);
      int curHoogte = (int)(staaf.hoogte * vergrotingsfactor);
      int x = tussenAfstand + staafBreedte*i + tussenAfstand*i;
      int y = height-curHoogte;
      rect(x, y, staafBreedte, curHoogte);
      fill(0, 0, 0);
      text(staaf.titel + " : " + staaf.hoogte, x, y-1);
      i++;
  }
  
  int streepjeStapgrote = (int)(tussenStreepjes / vergrotingsfactor);
  
  for(int j = 0; j < aantalStreepjes; j++){
     line(2, height - j*tussenStreepjes, 7, height - j*tussenStreepjes);
     text(j*streepjeStapgrote, 2, height - j*tussenStreepjes-1);
  }
}

class Staaf {
  
  int hoogte;
  String titel;
  color kleur;
  
  Staaf(int hoogte, String title, color kleur){
    this.hoogte = hoogte;
    this.titel = title;
    this.kleur = kleur;
  }
  
}

public Staaf[] stafen;
public int tussenAfstand;
public int aantalStreepjes;
void setup(){
  frame.setResizable(true);
  
  size(500, 600);
  
   stafen = new Staaf[]{
    new Staaf(100, "Koekjes", color(255, 0, 0)),
    new Staaf(200, "Stroopwafels", color(0, 255, 0)),
    new Staaf(900, "Cupcakes", color(0, 0, 255)),
    new Staaf(850, "Chocolade", color(88, 20, 20))
  };
  
  tussenAfstand = 50;
  aantalStreepjes = 10;
}

void draw(){
  //////////rekenen
  int hoogsteStaaf = 0;
  int gemiddelde = 0;
  for(Staaf staaf : stafen){
      gemiddelde += staaf.hoogte;
      if(staaf.hoogte > hoogsteStaaf)
          hoogsteStaaf = staaf.hoogte;
  }
  gemiddelde /= stafen.length;
  
  float vergrotingsfactor = (height*0.75) / hoogsteStaaf;
  int staafBreedte = (width-tussenAfstand) / stafen.length - tussenAfstand;
  int tussenStreepjes = height/aantalStreepjes;
  int streepjeStapgrote = (int)(tussenStreepjes / vergrotingsfactor);
  /////Tekenen
  background(255, 255, 255);
  
  //streepjes
  for(int j = 0; j < aantalStreepjes; j++){
     line(2, height - j*tussenStreepjes, width, height - j*tussenStreepjes);
     text(j*streepjeStapgrote, 2, height - j*tussenStreepjes-1);
  }

  //gemiddelde
  fill(255,0,0);
  line(0, gemiddelde*vergrotingsfactor, width, gemiddelde*vergrotingsfactor);
  text("gemiddelde", 65, gemiddelde*vergrotingsfactor-1);
  
  //stafen
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

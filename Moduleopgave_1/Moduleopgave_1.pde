void setup(){
  //variable declaratie
  int breedte = 500;
  int hoogte = 400;
  int tussenAfstand = 50;
  int agendaTussen = 40;
  
  Staaf[] stafen = new Staaf[]{
    new Staaf(100, "Staaf 1", color(255, 0, 0)),
    new Staaf(200, "Staaf 2", color(0, 255, 0)),
    new Staaf(400, "Staaf 3", color(0, 0, 255))
  };
  
  //tekenen
  size(breedte, hoogte);
  background(255, 255, 255);
  int hoogste = 0;
  for(Staaf staaf : stafen){
      if(staaf.hoogte > hoogste)
          hoogste = staaf.hoogte;
  }
  
  float hoogteFactor = (hoogte / 4*3.0) / hoogste;
  println(hoogteFactor);
  int staafBreedte = (breedte-tussenAfstand) / stafen.length - tussenAfstand;
  int i = 0;
  float hoosteGetekent = 0;
  for(Staaf staaf : stafen){
      fill(staaf.kleur);
      float curHoogte = (staaf.hoogte * hoogteFactor);
      if(curHoogte > hoosteGetekent)
          hoosteGetekent = curHoogte;
      rect(tussenAfstand + staafBreedte*i + tussenAfstand*i, hoogte-curHoogte, staafBreedte, curHoogte);
      i++;
  }
  int aantalStreepjes = hoogte/agendaTussen;
  println(aantalStreepjes);
  float streepjeStapgrote = hoosteGetekent/3*4/aantalStreepjes;
  
  for(int j = 1; j < aantalStreepjes; j++){
     line(2, hoogte - j*agendaTussen, 7, hoogte - j*agendaTussen);
     text("" + j*streepjeStapgrote, 2, hoogte - j*agendaTussen);
  }
  
}

class Staaf {
  
  int hoogte;
  String titel;
  color kleur;
  
  Staaf(int hoogte, String title, color kleur){
    this.hoogte = hoogte;
    this.titel = titel;
    this.kleur = kleur;
  }
  
}

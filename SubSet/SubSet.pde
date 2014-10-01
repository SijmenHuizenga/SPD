enum Vorm{
  DRIEHOEK, RECHTHOEK, RONDJE;
}
enum Kleur{
  ROOD(color(255, 0, 0)), 
  GROEN(color(0, 255, 0)), 
  BLAUW(color(0, 0, 255));
  int kleur;
  Kleur(int k){
    this.kleur = k;
  }
}
class Kaart{
  Kleur kleur;
  Vorm vorm;
  int aantal;
  public Kaart(){
  }
}

void setup(){
  
}

void draw(){
  
}

PImage jonge;
PImage meisje;

int families = 123;
int meisjes = 0;

void berekenFamilie(){
  while(true)
     if(random(2) < 1)
        meisjes++;
     else
        return;
}
void setup(){
  jonge = loadImage("jonge.png");
  meisje = loadImage("meisje.png");
  
  for(int i = 0; i < families; i++)
      berekenFamilie();
  
  size(250, 250);
}

void draw(){
  background(0);
  image(jonge, 50, 50);
  image(meisje, 150, 50);
  fill(255);
  textSize(30);
  text(families, 30, 130);
  text(meisjes, 130, 130);
}

void mousePressed(){
  meisjes = 0;
  for(int i = 0; i < families; i++)
      berekenFamilie();
}

void setup(){
    background(200, 200, 200);
    size(500, 500);
    
    //opdracht 1.4 + 1.5
    drawJapaneseFlag(50, 200, 150);
    drawNippon(50, 200, 150);
}

public void drawJapaneseFlag(int x, int y, int hoogte){
     int breedte = hoogte/2*3; //verhouding is 3:2
     fill(255, 255, 255);
     rect(x, y, breedte, hoogte);
     fill(255, 0, 0);
     ellipse(x+breedte/2, y+hoogte/2, hoogte/2, hoogte/2);
}
public void drawNippon(int x, int y, int hoogte){
     int breedte = hoogte/2*3; //verhouding is 3:2
     fill(0, 0, 0);
     text("Nippon", x-20 + breedte/2, y + hoogte/2);
}




void setup(){
    //opdracht 1.3
    background(200, 200, 200);
    size(500, 500);
    //opdracht 1.2
    printAndDraw("125 - 23 = " + (125 - 23));
    printAndDraw("75 * 3 = " + (75 *3));
    printAndDraw("45 % 7 = " + (45 % 7));
    printAndDraw("45 / 7 = " + (45 / 7));
    printAndDraw("45.0 / 7 = " + (45.0 / 7));
}

public static int lines = 0;
public void printAndDraw(String toDraw){
   fill(0, 0, 0);
   text(toDraw, 50, 50 + lines*17);
   println(toDraw);
   lines++;
}

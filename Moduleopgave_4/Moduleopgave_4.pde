public class Lamp{
  public boolean isOn = false;
  public static final int LAMP_WIDTH = 200, LAMP_HEIGHT = 300, MARGIN = 50;
  
  private int x, y, lampColorOn, lampColorOff;
  public Lamp(int x, int y, int lampColorOn, int lampColorOff){
    this.x = x;
    this.y = y;
    this.lampColorOn = lampColorOn;
    this.lampColorOff = lampColorOff;
  }
  public void paint(){
    stroke(0);
    fill(PEDALCOLOR);
    rect(x+MARGIN, y, LAMP_WIDTH-2*MARGIN, LAMP_HEIGHT/2);
    fill(isOn ? lampColorOn : lampColorOff);
    ellipse(x + LAMP_WIDTH/2, y , LAMP_HEIGHT/2, LAMP_HEIGHT/2);
  }
}
public class ToggleButton{
  public int COLOR_ON = color(100, 100, 100);
  public int COLOR_OFF = color(150, 150, 150);
  private int x, y, w, h;
  public boolean isSelected = false;
  public String txt;
  public ToggleButton(String txt, int x, int y, int w, int h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.txt = txt;
  }
  public void paint(){
    fill(isSelected ? COLOR_ON : COLOR_OFF);
    rect(x, y, w, h);
    fill(0);
    text(txt, x+w/2-30, y+h/2);
  }
  public void onClick(){
     if(x < mouseX && mouseX < x + w && y < mouseY && mouseY < y + h)
       isSelected = !isSelected;
  }
}

public int PEDALCOLOR = color(100, 100, 100);
public Lamp[] lamps = new Lamp[]{
  new Lamp(0, 100, color(255, 0, 0), color(150, 0, 0)),
  new Lamp(200, 100, color(0, 255, 0), color(0, 150, 0)),
  new Lamp(400, 100, color(0, 0, 255), color(0, 0, 150))
};

ToggleButton but = new ToggleButton("Lamp aan?", 50, 400, 500, 100);

void setup(){
  size(600, 600);
}
void draw(){
  
  for(Lamp l : lamps){
    if(but.isSelected)
      l.isOn = ! l.isOn;
    l.paint();
  }
  but.paint();
}

void mouseReleased(){
  but.onClick();
}


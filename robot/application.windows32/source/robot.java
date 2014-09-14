import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import robot.common.*; 
import robot.server.*; 
import javax.swing.JOptionPane; 
import static robot.client.RobotManager.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class robot extends PApplet {






/*

Er moet een robot zijn. Een blouwe robot die jij zelf kan besturen dmv de pijltjestoestsen.
Je connect aan een server. Die geeft de locatie van alle andere spelers. Deze spelers worden
als rode robotjes weergegeven. 


Dus als je op pijltje rechts drukt, ga je naar rechts.
Als je op pijltje links drukt, dan ga je naar links.
pijltje down = naar beneden en pijltje up = naar boven.

*/

int blockSize = 30;
int gridWidth = 30;
int gridHeight= 20;

public void setup(){
  size(gridWidth*blockSize, gridHeight*blockSize);
  String name = (String)JOptionPane.showInputDialog(null, "What  is your name?", "Name?", JOptionPane.QUESTION_MESSAGE);
  if(name == null || name.equals(""))
    System.exit(0);
  connect(name, "195.169.163.86"); 
  setRobotX(5);
  setRobotY(5);
}

public void draw(){
  background(0);
  fill(255);
  text(getRobotName(), getRobotX()*blockSize, getRobotY()*blockSize);
  
  fill(0, 255, 0);
  rect(getRobotX()*blockSize, getRobotY()*blockSize, blockSize, blockSize);
  
  for(Robot r : getOthers()){
    fill(255);
    text(r.name, r.x*blockSize, r.y*blockSize);
    fill(255, 0, 0);
    rect(r.x*blockSize, r.y*blockSize, blockSize, blockSize);
  }
}

public void keyPressed(){
  switch(keyCode){
      case UP:   setRobotY(constrain(getRobotY()-1, 0, gridHeight-1)); break;
      case DOWN: setRobotY(constrain(getRobotY()+1, 0, gridHeight-1)); break;
      case RIGHT:setRobotX(constrain(getRobotX()+1, 0, gridWidth-1)); break;
      case LEFT: setRobotX(constrain(getRobotX()-1, 0, gridWidth-1)); break;
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "robot" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

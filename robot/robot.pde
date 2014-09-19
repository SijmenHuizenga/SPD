import robot.common.*;
import robot.server.*;
import javax.swing.JOptionPane;
import static robot.client.RobotManager.*;

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

void setup(){
  size(gridWidth*blockSize, gridHeight*blockSize);
  String name = (String)JOptionPane.showInputDialog(null, "What is your name?", "Name?", JOptionPane.QUESTION_MESSAGE);
  String ip = (String)JOptionPane.showInputDialog(null, "What the server ip?", "ip?", JOptionPane.QUESTION_MESSAGE);
  if(name == null || name.equals(""))
    System.exit(0);
  connect(name, ip); 
  setRobotX(5);
  setRobotY(5);
}

void draw(){
  background(0);
  fill(255);
  text(getRobotName(), getRobotX()*blockSize, getRobotY()*blockSize);
  
  fill(0, 255, 0);
  rect(getRobotX()*blockSize, getRobotY()*blockSize, blockSize, blockSize);
  
  for(robot.common.Robot r : getOthers()){
    fill(255);
    text(r.name, r.x*blockSize, r.y*blockSize);
    fill(255, 0, 0);
    rect(r.x*blockSize, r.y*blockSize, blockSize, blockSize);
  }
}

void keyPressed(){
  switch(keyCode){
      case UP:   setRobotY(constrain(getRobotY()-1, 0, gridHeight-1)); break;
      case DOWN: setRobotY(constrain(getRobotY()+1, 0, gridHeight-1)); break;
      case RIGHT:setRobotX(constrain(getRobotX()+1, 0, gridWidth-1)); break;
      case LEFT: setRobotX(constrain(getRobotX()-1, 0, gridWidth-1)); break;
  }
}

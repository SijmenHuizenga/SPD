import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import rama.common.*; 
import rama.server.*; 
import static rama.client.Rama.*; 
import javax.swing.JOptionPane; 

import rama.common.*; 
import rama.server.*; 
import rama.client.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class client extends PApplet {






String version = "1.0";
int windowWidth = 400;
int windowHeight = 600;
Float spacingX = width * 0.02f;
Float spacingY = height * 0.02f;
Float inputBoxWidth = width - spacingX * 2;
Float inputBoxHeight = height * 0.2f;
Float outputBoxWidth = width - spacingX * 2;
Float outputBoxHeight = height * 0.8f - spacingY * 3 - 50;
String newMessage = "";
//String displayMessage = "";
ArrayList<Bericht> messages = new ArrayList<Bericht>();
int BLACK = 0xff000000;
int WHITHE = 0xffFFFFFF;

public void setup(){
  size(windowWidth, windowHeight);
  frame.setResizable(true);
  background(255);
  String myName = (String)JOptionPane.showInputDialog(null, "What is your name?", "Name?", JOptionPane.QUESTION_MESSAGE);
  connect(myName, "195.169.163.86");
}

public void draw(){
  spacingX = width * 0.02f;
  spacingY = height * 0.02f;
  inputBoxWidth = width - spacingX * 2;
  inputBoxHeight = height * 0.2f;
  outputBoxWidth = width - spacingX * 2;
  outputBoxHeight = height * 0.8f - spacingY * 3 - 50;
  background(222);
  fill(BLACK);
  textSize(38);
  text("Rama chat", spacingX, spacingY + 40);
  fill(WHITHE);
  rect(spacingX, height - inputBoxHeight - spacingY, inputBoxWidth, inputBoxHeight);
  rect(spacingX, spacingY + 50, outputBoxWidth, outputBoxHeight);
  fill(BLACK);
  textSize(11);
  while(isNieuwBericht()){
    messages.add(ontvangBericht());
  }
  for(int i = 0; i<messages.size(); i++){
    Bericht message = messages.get(i);
    text(message.tijd + "  " + message.naam +  ": " + message.inhoud, spacingX + 10, spacingY + 70 + (i * 15));
  }
  text(newMessage, spacingX + 10, height - inputBoxHeight - spacingY + 20);
  text("Version: " + version, 5, 15);
}

public void keyTyped(){
  if(key == ';'){
     //lekker puh
  }else if(key == BACKSPACE && newMessage.length() > 0){
     newMessage = newMessage.substring(0, newMessage.length() - 1);
  }else if(key == ENTER){
     zendBericht(newMessage, "");
     newMessage = "";
  }else{
    newMessage = newMessage + key;
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "client" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

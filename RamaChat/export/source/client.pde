import rama.common.*;
import rama.server.*;
import static rama.client.Rama.*;
import javax.swing.JOptionPane;

String version = "1.0";
int windowWidth = 400;
int windowHeight = 600;
Float spacingX = width * 0.02;
Float spacingY = height * 0.02;
Float inputBoxWidth = width - spacingX * 2;
Float inputBoxHeight = height * 0.2;
Float outputBoxWidth = width - spacingX * 2;
Float outputBoxHeight = height * 0.8 - spacingY * 3 - 50;
String newMessage = "";
//String displayMessage = "";
ArrayList<Bericht> messages = new ArrayList<Bericht>();
int BLACK = #000000;
int WHITHE = #FFFFFF;

void setup(){
  size(windowWidth, windowHeight);
  frame.setResizable(true);
  background(255);
  String myName = (String)JOptionPane.showInputDialog(null, "What is your name?", "Name?", JOptionPane.QUESTION_MESSAGE);
  connect(myName, "195.169.163.86");
}

void draw(){
  spacingX = width * 0.02;
  spacingY = height * 0.02;
  inputBoxWidth = width - spacingX * 2;
  inputBoxHeight = height * 0.2;
  outputBoxWidth = width - spacingX * 2;
  outputBoxHeight = height * 0.8 - spacingY * 3 - 50;
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

void keyTyped(){
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

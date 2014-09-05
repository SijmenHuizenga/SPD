import java.util.Random;

public boolean running = true;
public String word = "SWEK"; 
public int randColor;
public String[] words = new String[]{"Swek", "Yolo", "Ehh", "Lol!", ":D"};
void setup(){
     sketchFullScreen();
     size(displayWidth, displayHeight);

     new Thread(new Runnable(){
        public void run(){
           while(running){
               word = randomWord();
               randColor = randomColor();
               try{
                   Thread.sleep(700);
               }catch(Exception e){
                  e.printStackTrace(); 
               }
           }
        } 
     }).start(); 
  
  
}
Random rand = new Random();
String randomWord(){
   return words[rand.nextInt(words.length)];
}
int randomColor(){
   return color(rand.nextInt(255), rand.nextInt(255), rand.nextInt(255)); 
}

void draw(){
  fill(randColor);
  rect(0, 0, width, height);
  fill(255, 255, 255);
  textSize(height/2);
  text(word, 0, height);
}

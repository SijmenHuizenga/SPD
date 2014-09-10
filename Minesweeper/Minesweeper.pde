import java.util.Random;
import java.awt.event.KeyEvent;

int[][] blocks = new int[rows][colomns];  //row, colomn
PImage bom_exploded, bom_found, bom_notfound, vlag;
boolean running = true;
boolean debug = false;
boolean youWon = false;
boolean firstClick = true;

void setup() {
  bom_exploded = loadImage("bom_exploded.png");
  bom_found = loadImage("bom_found.png");
  bom_notfound = loadImage("bom_notfound.png");
  vlag = loadImage("vlag.png");
  startGame();
}

void startGame(){
  running = true;
  youWon = false;
  firstClick = true;
  size((rows+2)*blockSize, (colomns+2)*blockSize);
  frame.setResizable(true);
  startTimer();
  for (int row = 0; row<rows; row++) {
    for (int colomn = 0; colomn<colomns; colomn++) {
      blocks[row][colomn] = COVERED_EMPTY;
    }
  }
}

void generateLevel(int emptyRow, int emptyCol){
  Random rand = new Random();
  for (int row = 0; row<rows; row++) {
    for (int colomn = 0; colomn<colomns; colomn++) {
      if(row == emptyRow && colomn == emptyCol)
        blocks[row][colomn] = COVERED_EMPTY;
      else if (rand.nextInt(100) < persentage)
        blocks[row][colomn] = COVERED_BOM;
      else
        blocks[row][colomn] = COVERED_EMPTY;
    }
  }
}

void mousePressed() {
  if(!running)
    return;
  int row = mouseX/blockSize-1;
  int col = mouseY/blockSize-1;
  if (row < 0 || row >= rows || col < 0 || col >= colomns)
    return;
  if(firstClick){
    generateLevel(row, col);
    firstClick = false;
  }
  int nr = blocks[row][col];
  if(mouseButton == LEFT){
      if(nr == COVERED_BOM){
        running = false;
        stopTimer();
        for (int roww = 0; roww<rows; roww++) {
          for (int colomn = 0; colomn<colomns; colomn++) {
              if(blocks[roww][colomn] == COVERED_BOM)
                  blocks[roww][colomn] = NOTFOUND;
              if(blocks[roww][colomn] == FLAGGED_BOM)
                  blocks[roww][colomn] = FOUND;
          }
      }
      blocks[row][col] = EXPLODED;
      }else if(nr == COVERED_EMPTY){
          blocks[row][col] = getBlockNumber(row, col);
          if(blocks[row][col] == OPEN_EMPTY)
              spread(row, col);
      }
  }else if(mouseButton == RIGHT){
      if(nr == COVERED_BOM){
          blocks[row][col] = FLAGGED_BOM;
      }else if(nr == COVERED_EMPTY){
          blocks[row][col] = FLAGGED_EMPTY;
      }else if(nr == FLAGGED_BOM){
          blocks[row][col] = COVERED_BOM;
      }else if(nr ==FLAGGED_EMPTY){
          blocks[row][col] = COVERED_EMPTY;
      }
  }
}
void keyPressed(){
  if(keyCode == KeyEvent.VK_D)
    debug = !debug;
  if(keyCode == KeyEvent.VK_R)
    startGame();
}

int getBlockNumber(int row, int col) {
  return 
    hasBlockBom(row+1, col)+ 
    hasBlockBom(row, col+1)+ 
    hasBlockBom(row+1, col+1)+ 
    hasBlockBom(row-1, col)+ 
    hasBlockBom(row, col-1)+ 
    hasBlockBom(row-1, col-1)+ 
    hasBlockBom(row+1, col-1)+ 
    hasBlockBom(row-1, col+1) + 10;
}
int hasBlockBom(int row, int col) {
    if (row < 0 || row >= rows || col < 0 || col >= colomns)
      return 0;
    return (blocks[row][col] == COVERED_BOM || blocks[row][col] == FLAGGED_BOM) ? 1 : 0;
}

void draw() {
  paint();
  checkDone();
}

void checkDone(){
  if(!running)
    return;
  if(bombAmount() == closedBlocks()){
     running = false;
     youWon = true;
     stopTimer(); 
     for (int row = 0; row<rows; row++)
        for (int colomn = 0; colomn<colomns; colomn++)
           if(blocks[row][colomn] == COVERED_BOM)
              blocks[row][colomn] = FLAGGED_BOM;
  }
}

int bombAmount(){
  int out = 0;
  for (int row = 0; row<rows; row++) {
    for (int colomn = 0; colomn<colomns; colomn++) {
      if(blocks[row][colomn] == COVERED_BOM || blocks[row][colomn] == FLAGGED_BOM){
         out++;
      }
    }
  }
  return out;
}

int closedBlocks(){
  int out = 0;
  for (int row = 0; row<rows; row++) {
    for (int colomn = 0; colomn<colomns; colomn++) {
      if(blocks[row][colomn] == COVERED_BOM || blocks[row][colomn] == COVERED_EMPTY || 
            blocks[row][colomn] == FLAGGED_BOM || blocks[row][colomn] == FLAGGED_EMPTY){
          out++;
      }
    }
  }
  return out;
}


import java.util.Random;
import java.awt.event.KeyEvent;

int[][] blocks = new int[rows][colomns];  //row, colomn
PImage bom_exploded, bom_found, bom_notfound, vlag;
boolean running = true;
boolean debug = false;

void setup() {
  bom_exploded = loadImage("bom_exploded.png");
  bom_found = loadImage("bom_found.png");
  bom_notfound = loadImage("bom_notfound.png");
  vlag = loadImage("vlag.png");

  size((colomns+2)*blockSize, (rows+2)*blockSize);
  frame.setResizable(true);
  Random rand = new Random();
  for (int row = 0; row<rows; row++) {
    for (int colomn = 0; colomn<colomns; colomn++) {
      int r = rand.nextInt(100);
      if (r < persentage)
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
  int nr = blocks[row][col];
  if(mouseButton == LEFT){
      if(nr == COVERED_BOM){
        running = false;
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
}


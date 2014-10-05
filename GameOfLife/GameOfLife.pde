int boardW = 500;
int boardH = 500;

int alive = color(20, 20, 20);
int dead = color(200, 200, 200);

boolean[][] board = new boolean[boardW][boardH];

boolean running = false;

void setup(){
  size(boardW, boardH);
}

void draw(){
  if(running){
      boolean[][] newBoard = new boolean[boardW][boardH];
      for(int x = 0; x < boardW; x++){
         for(int y = 0; y < boardH; y++){
             int neighbours = countLiveNeighbours(x, y);
             boolean live = board[x][y];
             if(live && neighbours < 2)
               newBoard[x][y] = false;
             else if(live && (neighbours == 3 || neighbours == 2))
               newBoard[x][y] = true;
             else if(live && neighbours > 3)
               newBoard[x][y] = false;
             else if(!live && neighbours == 3)
               newBoard[x][y] = true;
             else
               newBoard[x][y] = live;
         }
      }
      board = newBoard;  
  }
  
  for(int x = 0; x < boardW; x++){
     for(int y = 0; y < boardH; y++){
       if(board[x][y])
          set(x, y, alive);
       else
          set(x, y, dead);
     }
  }
}

int countLiveNeighbours(int x, int y){
  int out = 0;
  if(isAliveAndExists(x+1, y))
    out++;
  if(isAliveAndExists(x-1, y))
    out++;
  if(isAliveAndExists(x, y+1))
    out++;
  if(isAliveAndExists(x, y-1))
    out++;
  if(isAliveAndExists(x+1, y+1))
    out++;
  if(isAliveAndExists(x-1, y-1))
    out++;
  if(isAliveAndExists(x-1, y+1))
    out++;
  if(isAliveAndExists(x+1, y-1))
    out++;
  return out;
}

boolean isOutsideBounds(int x, int y){
  return x < 0 || y < 0 || x >= boardW || y >= boardH;
}

boolean isAliveAndExists(int x, int y){
  return isOutsideBounds(x, y) ? false : board[x][y];
}

void mouseDragged(){
    setBoard(mouseX, mouseY, true);
    setBoard(mouseX+1, mouseY, true);
    setBoard(mouseX-1, mouseY, true);
    setBoard(mouseX, mouseY+1, true);
    setBoard(mouseX, mouseY-1, true);
    fill(255);
    stroke(255);
}
void mousePressed(){
  setBoard(mouseX, mouseY, true);
}

void setBoard(int x, int y, boolean value){
    if(isOutsideBounds(x, y))
      return;
    board[x][y] = value;
}

void keyPressed(){
  running = !running;
  println(running);
}


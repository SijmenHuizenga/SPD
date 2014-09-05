import java.util.Random;

static final int COVERED_BOM = 1;
static final int COVERED_EMPTY = 2;

static final int FLAGGED_BOM = 3;
static final int FLAGGED_EMPTY = 4;

static final int OPEN_EMPTY =10;
static final int OPEN_NR_1 = 11;
static final int OPEN_NR_2 = 12;
static final int OPEN_NR_3 = 13;
static final int OPEN_NR_4 = 14;
static final int OPEN_NR_5 = 15;
static final int OPEN_NR_6 = 16;
static final int OPEN_NR_7 = 17;
static final int OPEN_NR_8 = 18;

static final int EXPLODED = 20;
static final int FOUND = 21;
static final int NOTFOUND = 22;


static final int rows = 20;
static final int colomns = 20;

static final int blockSize = 50;
static final int persentage = 20;


int[][] blocks = new int[rows][colomns];  //row, colomn
PImage bom_exploded, bom_found, bom_notfound, vlag;

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

void mouseClicked() {
  int row = mouseX/blockSize-1;
  int col = mouseY/blockSize-1;
  if (row < 0 || row >= rows || col < 0 || col >= colomns)
    return;
  int nr = blocks[row][col];
  if(nr == COVERED_BOM)
      System.exit(0);
  if(nr == COVERED_EMPTY){
      blocks[row][col] = getBlockNumber(row, col);
  }
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
};
int hasBlockBom(int row, int col) {
    if (row < 0 || row >= rows || col < 0 || col >= colomns)
      return 0;
  
    return (blocks[row][col] == COVERED_BOM || blocks[row][col] == FLAGGED_BOM) ? 1 : 0;
};

void draw() {
  for (int row = 0; row<rows; row++) {
    for (int colomn = 0; colomn<colomns; colomn++) {
      switch(blocks[row][colomn]) {
      case COVERED_EMPTY: 
        fill(100, 100, 100);
        rect((row+1)*blockSize, colomn*blockSize+blockSize, blockSize, blockSize);
        break;
      case COVERED_BOM: 
        fill(100, 100, 100);
        rect((row+1)*blockSize, colomn*blockSize+blockSize, blockSize, blockSize);
        break;
      case FLAGGED_BOM:
        fill(100, 100, 100);
        rect((row+1)*blockSize, colomn*blockSize+blockSize, blockSize, blockSize);
        image(vlag, (row+1)*blockSize, (1+colomn)*blockSize, blockSize, blockSize);
        break;
      case FLAGGED_EMPTY:
        fill(100, 100, 100);
        rect((row+1)*blockSize, colomn*blockSize+blockSize, blockSize, blockSize);
        image(vlag, (row+1)*blockSize, (1+colomn)*blockSize, blockSize, blockSize);
        break;
      case OPEN_EMPTY:
        fill(200, 200, 200);
        rect((row+1)*blockSize, colomn*blockSize+blockSize, blockSize, blockSize);
        break;
      case EXPLODED:
        fill(200, 200, 200);
        rect((row+1)*blockSize, colomn*blockSize+blockSize, blockSize, blockSize);
        image(bom_exploded, (row+1)*blockSize, (1+colomn)*blockSize, blockSize, blockSize);
        break;
      case FOUND:
        fill(200, 200, 200);
        rect((row+1)*blockSize, colomn*blockSize+blockSize, blockSize, blockSize);
        image(bom_found, (row+1)*blockSize, (1+colomn)*blockSize, blockSize, blockSize);
        break;
      case NOTFOUND:
        fill(200, 200, 200);
        rect((row+1)*blockSize, colomn*blockSize+blockSize, blockSize, blockSize);
        image(bom_notfound, (row+1)*blockSize, (1+colomn)*blockSize, blockSize, blockSize);
        break;

      default:
        break;
      }
      if (blocks[row][colomn] > 10 && blocks[row][colomn] < 20) {
        int nr = blocks[row][colomn]-10;
        fill(100, 100, 100);
        rect((row+1)*blockSize, colomn*blockSize+blockSize, blockSize, blockSize);
        fill(255, 255, 255);
        text(nr, (row+1)*blockSize, (colomn+2)*blockSize);
      }
    }
  }
}


int coveredColor = color(100, 100, 100);
int openColor = color(200, 200,200);
int bombDebug = color(255, 100, 100);
int background = color(200, 200,200);

void paint(){
 background(background);
 textSize(15);
 fill(0, 0, 0);
 text(getTime(), 5, 15);
 if(youWon){
   fill(randomColor());
   text("You finished the game!!!!!!!", width-200, 15);
 
 }
 for (int row = 0; row<rows; row++) {
    for (int colomn = 0; colomn<colomns; colomn++) {
      switch(blocks[row][colomn]) {
      case COVERED_EMPTY: 
        fill(coveredColor);
        rect((row+1)*blockSize, colomn*blockSize+blockSize, blockSize, blockSize);
        break;
      case COVERED_BOM: 
        if(debug)
          fill(bombDebug);
        else
          fill(coveredColor);
        rect((row+1)*blockSize, colomn*blockSize+blockSize, blockSize, blockSize);
        break;
      case FLAGGED_BOM:
        fill(coveredColor);
        rect((row+1)*blockSize, colomn*blockSize+blockSize, blockSize, blockSize);
        image(vlag, (row+1)*blockSize, (1+colomn)*blockSize, blockSize, blockSize);
        break;
      case FLAGGED_EMPTY:
        fill(coveredColor);
        rect((row+1)*blockSize, colomn*blockSize+blockSize, blockSize, blockSize);
        image(vlag, (row+1)*blockSize, (1+colomn)*blockSize, blockSize, blockSize);
        break;
      case OPEN_EMPTY:
        fill(openColor);
        rect((row+1)*blockSize, colomn*blockSize+blockSize, blockSize, blockSize);
        break;
      case EXPLODED:
        fill(openColor);
        rect((row+1)*blockSize, colomn*blockSize+blockSize, blockSize, blockSize);
        image(bom_exploded, (row+1)*blockSize, (1+colomn)*blockSize, blockSize, blockSize);
        break;
      case FOUND:
        fill(openColor);
        rect((row+1)*blockSize, colomn*blockSize+blockSize, blockSize, blockSize);
        image(bom_found, (row+1)*blockSize, (1+colomn)*blockSize, blockSize, blockSize);
        break;
      case NOTFOUND:
        fill(openColor);
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
        textSize(blockSize);
        text(nr, (row+1)*blockSize+2, (colomn+2)*blockSize-2);
      }
    }
  } 
}
Random rand = new Random();
int randomColor(){
   return color(rand.nextInt(255), rand.nextInt(255), rand.nextInt(255)); 
}

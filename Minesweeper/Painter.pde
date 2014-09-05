void paint(){
 for (int row = 0; row<rows; row++) {
    for (int colomn = 0; colomn<colomns; colomn++) {
      switch(blocks[row][colomn]) {
      case COVERED_EMPTY: 
        fill(100, 100, 100);
        rect((row+1)*blockSize, colomn*blockSize+blockSize, blockSize, blockSize);
        break;
      case COVERED_BOM: 
        fill(255, 100, 100);
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
        textSize(blockSize);
        text(nr, (row+1)*blockSize+5, (colomn+2)*blockSize-5);
      }
    }
  } 
}

import java.awt.Point;
import java.util.HashSet;
import java.util.Set;

public void spread(int row, int col){
    //de punten die nu gechecked worden.
    Set<Point> lastChecked = new HashSet<Point>();
    //de punten die in de volgende ronden worden gechecked.
    Set<Point> toCheck = new HashSet<Point>();
    
    //houd bij welke coordinaten al bekeken zijn.
    boolean[][] checked = new boolean[rows][colomns];  //defalut value is false;
    
    lastChecked.add(new Point(row, col));
    while(true){
      toCheck.clear();
      for(Point p : lastChecked){
         //eerst de blokken links, recht, boven en onder bekijken
         //Als deze geen bom bevat, dan wordt hij geopend.
         //als het block daarnaa geen cijfer bevat, dan wordt
         //het punt toegevoegd aan het toCheck array.
         for(Point q : getBlocksAround(p)){
             if(isOutOfBounds(q))
                 continue;
             if(blocks[q.x][q.y] == COVERED_EMPTY){
                 blocks[q.x][q.y] = getBlockNumber(q.x, q.y);
                 if(blocks[q.x][q.y] == OPEN_EMPTY && !checked[q.x][q.y]){
                       toCheck.add(q);
                 }
             }
             checked[q.x][q.y] = true;
         }
         //daarnaa worden alle hoeken bekeken.
         //als een hoek na opening een cijfer zou 
         //bevatten, dan wordt hij geopend.
         for(Point q : getCornersAround(p)){
             if(isOutOfBounds(q))
                 continue;
             if(blocks[q.x][q.y] == COVERED_EMPTY){
                 int newNr = getBlockNumber(q.x, q.y);
                 if(newNr != OPEN_EMPTY)
                     blocks[q.x][q.y] = newNr;
             }
             
         }
      }
      lastChecked = new HashSet<Point>(toCheck);
      //als er niks meer te checken valt, dan zijn we klaar!
      if(lastChecked.size() == 0)
         break;
    }
    
}

private ArrayList<Point> getBlocksAround(Point p){
    ArrayList<Point> o = new ArrayList<Point>();
  
    o.add(new Point(p.x+1, p.y));
    o.add(new Point(p.x, p.y+1));
    o.add(new Point(p.x-1, p.y));
    o.add(new Point(p.x, p.y-1));
  
    return o;
}

private ArrayList<Point> getCornersAround(Point p){
    ArrayList<Point> o = new ArrayList<Point>();
  
    o.add(new Point(p.x+1, p.y+1));
    o.add(new Point(p.x-1, p.y-1));
    o.add(new Point(p.x-1, p.y+1));
    o.add(new Point(p.x+1, p.y-1));
  
    return o;
}

private boolean isOutOfBounds(Point p){
   return p.x < 0 || p.x >= rows || p.y < 0 || p.y >= colomns; 
}

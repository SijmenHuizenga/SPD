import java.awt.Point;
import java.util.HashSet;
import java.util.Set;

public void spread(int row, int col){
    Set<Point> lastChecked = new HashSet<Point>();
    Set<Point> toCheck = new HashSet<Point>();
    
    boolean[][] checked = new boolean[rows][colomns];  //defalut value is false;
    
    lastChecked.add(new Point(row, col));
    println("starting scan...");
    while(true){
      toCheck.clear();
      println("loop 1");
      for(Point p : lastChecked){
        println("loop 2: " + p);
         for(Point q : getPointsAround(p)){
             println("loop 3: " + q);
             if(isOutOfBounds(q)){
                 println("this one is out of bounds!");
                 continue;
             }
             
             if(blocks[q.x][q.y] == COVERED_EMPTY){
                 blocks[q.x][q.y] = getBlockNumber(q.x, q.y);
                 println("this one is covered and empty, opening.... ping! " + blocks[q.x][q.y]);
                 if(blocks[q.x][q.y] == OPEN_EMPTY){
                     println("Ther was no number, so we can check if he has already been checked...");
                     if(!checked[q.x][q.y]){
                         println("adding to toCheck arra...");
                         toCheck.add(q);
                      }
                 }
             }
             checked[q.x][q.y] = true;
         }
      }
      lastChecked = new HashSet<Point>(toCheck);
      if(lastChecked.size() == 0)
         break;
    }
    
}

private ArrayList<Point> getPointsAround(Point p){
    ArrayList<Point> o = new ArrayList<Point>();
  
    o.add(new Point(p.x+1, p.y+1));
    o.add(new Point(p.x+1, p.y));
    o.add(new Point(p.x, p.y+1));
    o.add(new Point(p.x-1, p.y));
    o.add(new Point(p.x, p.y-1));
    o.add(new Point(p.x-1, p.y-1));
    o.add(new Point(p.x-1, p.y+1));
    o.add(new Point(p.x+1, p.y-1));
  
    return o;
}

private boolean isOutOfBounds(Point p){
   return p.x < 0 || p.x >= rows || p.y < 0 || p.y >= colomns; 
}

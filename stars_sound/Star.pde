public class Star {
  // MouseX coordinate
  private int x;
  // MouseY coordinate
  private int y;
  // Size (ToolPoint size)
  private int size;
  
  public Star(int x, int y, int size){
    this.x = x;
    this.y = y;
    this.size = size;
  }
  
  public int getX(){ return x; }
  public int getY(){ return y; }
  public int getSize(){ return size; }
 
  public boolean equals(Star other){
    return x == other.getX() && y == other.getY();
  }
}

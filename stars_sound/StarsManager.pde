// Singleton
public static class StarsManager {
  private static StarsManager instance = new StarsManager();
  private ArrayList<Star> stars = new ArrayList<Star>();
  
  private StarsManager(){}
  
  public static StarsManager getInstance(){ return instance; }
  
  public void addStar(Star star){
    if (!isAtPosition(star)){
      stars.add(star); 
      println("Added star at point " + star.getX() + ", " + star.getY() + " ---> size: " + star.getSize());
    }
  }
  public ArrayList<Star> getStars(){ return stars; }
  
  private boolean isAtPosition(Star star){
    for (Star starV: stars){
      if (star.equals(starV)) return true;
    }
    return false;
  }
}

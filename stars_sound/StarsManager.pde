// Singleton
public static class StarsManager {
  // Max number of points in the constelation
  public static final int MAX_NUM_STARS = 12;
  
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
  
  public void deleteLastStar(){
    if (stars.size() > 0){
      stars.remove(stars.size() -1);
      println("Deleted last star");
    }
  }
  
  public ArrayList<Star> getStars(){ return stars; }
  
  // Return true if there's a star at [star.getX(), star.getY()] coordinate
  private boolean isAtPosition(Star star){
    for (Star starV: stars){
      if (star.equals(starV)) return true;
    }
    return false;
  }
}

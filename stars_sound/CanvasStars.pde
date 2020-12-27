public class CanvasStars {
  public static final int START_HEIGHT_CANVAS = 58;
  public static final int WIDTH_CANVAS = 900;
  public static final int HEIGHT_CANVAS = 600;
  
  // Background image
  private PImage bGimage = loadImage("data/wallpaper.jpg");
  
  // Stars Manager
  private StarsManager starsManager = StarsManager.getInstance();
  
  public void draw(Main main){
    background(20);
    
    // Background image
    showBackgroundImage();
    // Interface separator
    showLineSeparator();
    
    stroke(255);
    fill(255);
    
    // Draw previous stars
    drawPreviousStars();
    
    // Number of stars < MAX_NUM_STARS
    if (canDrawNewStar()){
      // Draw star if mouse is pressed
      drawStarIfPressed(main.getTPSelected());
      // Show point where the mouse is pointing
      showSelectedToolSize(main.getTPSelected());
    }
  }
  
  private void showSelectedToolSize(ToolPoint tP){
    if (mouseY > START_HEIGHT_CANVAS+tP.getSize()/2)
      circle(mouseX, mouseY, tP.getSize());
  }
  
  private void drawStarIfPressed(ToolPoint tP){
    if (mousePressed && mouseButton == LEFT && mouseY > START_HEIGHT_CANVAS+tP.getSize()/2){
       circle(mouseX, mouseY, tP.getSize());
       addStar(mouseX, mouseY, tP.getSize());
    }
  }
  
  // Return true if there are less stars in canvas than MAX_NUM_STARS
  private boolean canDrawNewStar(){
    return starsManager.getStars().size() < StarsManager.MAX_NUM_STARS;
  }
  
  private void drawPreviousStars(){
    fill(255);
    ArrayList<Star> stars = starsManager.getStars();
    
    for (int i = 0; i < stars.size(); i++){
      if (i != 0){
        line(stars.get(i-1).getX(), stars.get(i-1).getY(), stars.get(i).getX(), stars.get(i).getY());
      }
      circle(stars.get(i).getX(), stars.get(i).getY(), stars.get(i).getSize());
    }
  }
  
  private void addStar(int mouseXCoord, int mouseYCoord, int tPSize){
    starsManager.addStar(new Star(mouseXCoord, mouseYCoord, tPSize));
  }
 
  public void setBackgroundImage(PImage bGimage){ this.bGimage = bGimage; }
  
  private void showBackgroundImage(){
    imageMode(CENTER);
    
    int newWidth = width;
    int newHeight = height;
    
    if (bGimage.width < WIDTH_CANVAS) newWidth = WIDTH_CANVAS;
    if (bGimage.width < HEIGHT_CANVAS) newHeight = HEIGHT_CANVAS - START_HEIGHT_CANVAS;
    
    bGimage.resize(newWidth, newHeight);
    image(bGimage, width/2, height/2 + START_HEIGHT_CANVAS, newWidth, newHeight);
  }
  
  private void showLineSeparator(){
    stroke(45);
    strokeWeight(2.3);
    line(0, START_HEIGHT_CANVAS-2, width, START_HEIGHT_CANVAS-2);
  }
  
  public void deleteLastStar(){
    starsManager.deleteLastStar();
  }
}

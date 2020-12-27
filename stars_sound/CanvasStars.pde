public class CanvasStars {
  public static final int START_HEIGHT_CANVAS = 58;
  public static final int WIDTH_CANVAS = 900;
  public static final int HEIGHT_CANVAS = 600;
  
  private PImage bGimage = loadImage("data/wallpaper.jpg");
  
  public void draw(){
    background(20);
    showBackgroundImage();
    showLineSeparator();
  }
 
  public void setBackgroundImage(PImage bGimage){
    this.bGimage = bGimage;
  }
  
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
    stroke(40);
    strokeWeight(2);
    line(0, START_HEIGHT_CANVAS-2, width, START_HEIGHT_CANVAS-2);
  }
}

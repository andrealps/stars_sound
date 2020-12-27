public abstract class ToolPoint {
  Main main;
  PImage image;
  
  public ToolPoint(Main main){
    this.main = main;
    
    createPoint();
  }
  
  protected abstract void createPoint();
  protected abstract int getSize();
  
  public void changePoint(){
    main.setToolPointSelected(this);
  }
  
  // Callback to use when the button is clicked
  CallbackListener listener = new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      println("ToolPoint button clicked");
      changePoint();
    }
  };

}

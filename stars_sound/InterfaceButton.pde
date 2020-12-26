public abstract class InterfaceButton {
  Main main;
  PImage image;
  
  public InterfaceButton(Main main){
    this.main = main;
    createButton();
  }
  
  public abstract void createButton();
  public abstract void doOnClick();
  
   // Callback to use when the button is clicked
  CallbackListener listener = new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      println("Interface button clicked");
      doOnClick();
    }
  };
}

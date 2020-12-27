public class Main {
  private PApplet app;
  private ControlP5 cp5;
  
  // Points for drawing 
  private ArrayList<ToolPoint> toolPoints;
  private ToolPoint tpSelected;
  
  // Interface buttons
  private ArrayList<InterfaceButton> interfaceButtons;
  
  // Canvas 
  private CanvasStars canvas;
  
  public Main(PApplet app){
    this.app = app;
    this.cp5 = new ControlP5(app);
  }
  
  // Called by setUp
  public void run(){
    // Create buttons
    createButtons();
    // Create canvas
    createCanvas();
  }
  
  // Called by draw
  public void update(){
    canvas.draw();
  }
  
  public ControlP5 getControlP5(){ return cp5; }
  public PApplet getApp(){ return app; }
  
  /****************************** CANVAS ********************************/  
  private void createCanvas(){
    canvas = new CanvasStars();
  }
  
  public void changeBackgroundImage(PImage image){
    canvas.setBackgroundImage(image);
  }
  
  /****************************** BUTTONS ********************************/
  private void createButtons(){
    // Tool points
    createToolPoints();
    // Interface buttons
    createInterfaceButtons();
  }  
  
  /********* Tool points ************/
  private void createToolPoints(){
    toolPoints = new ArrayList<ToolPoint>();
    toolPoints.add(new BigPoint(this));
    toolPoints.add(new MediumPoint(this));
    toolPoints.add(new SmallPoint(this));
  }
  
  public void setToolPointSelected(ToolPoint tP){
    this.tpSelected = tP;
  }
  
  /********* Interface buttons ************/
  private void createInterfaceButtons(){
    interfaceButtons = new ArrayList<InterfaceButton>();
    // Upload button (image)
    interfaceButtons.add(new UploadButton(this));
    // TODO: download button (xml)
  }
}

public class Main {
  private PApplet app;
  private ControlP5 cp5;
  
  // Title
  private PFont fontTitle;
  private PImage iconTitle;
  
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
    
    fontTitle = loadFont("StarsSoundFont.vlw");
    iconTitle = loadImage("musical-notes.png");
  }
  
  // Called by draw
  public void update(){
    canvas.draw(this);
    // Show Title
    showTitle();
  }
  
  public ControlP5 getControlP5(){ return cp5; }
  public PApplet getApp(){ return app; }
  public ToolPoint getTPSelected(){ return tpSelected; }
  
  /****************************** TITLE *********************************/
  private void showTitle(){
    // Show "Stars Sound"
    showTextTitle();
    // Show musical notes icon
    showIconTitle();
  }
  
  private void showTextTitle(){
    fill(#C7D9FC);
    textFont(fontTitle);
    textSize(35);
    text("Stars Sound", 290, 43);
  }
  
  private void showIconTitle(){
    imageMode(CENTER);
    image(iconTitle, 530, 32);
  }
  
  /****************************** CANVAS ********************************/  
  private void createCanvas(){
    canvas = new CanvasStars();
  }
  
  public void changeBackgroundImage(PImage image){
    canvas.setBackgroundImage(image);
  }
  
  public void deleteLastStar(){
    canvas.deleteLastStar();
  }
  
  /****************************** BUTTONS ********************************/
  private void createButtons(){
    // Tool points
    createToolPoints();
    // Interface buttonsz
    createInterfaceButtons();
  }  
  
  /********* Tool points ************/
  private void createToolPoints(){
    toolPoints = new ArrayList<ToolPoint>();
    toolPoints.add(new BigPoint(this));
    toolPoints.add(new MediumPoint(this));
    toolPoints.add(new SmallPoint(this));
    
    setToolPointSelected(toolPoints.get(0));
  }
  
  public void setToolPointSelected(ToolPoint tP){
    this.tpSelected = tP;
  }
  
  /********* Interface buttons ************/
  private void createInterfaceButtons(){
    interfaceButtons = new ArrayList<InterfaceButton>();
    // Upload button (image)
    interfaceButtons.add(new UploadButton(this));
    // Delete button
    interfaceButtons.add(new DeleteButton(this));
    // TODO: download button (Ruby textfile)
  }
}

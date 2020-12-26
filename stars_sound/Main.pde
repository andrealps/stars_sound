public class Main {
  private ControlP5 cp5;
  
  // Points for drawing 
  private ArrayList<ToolPoint> toolPoints;
  private ToolPoint tpSelected;
  
  public void run(ControlP5 cp5){
    this.cp5 = cp5;
    
    // Create buttons
    createButtons();
  }
  
  public ControlP5 getControlP5(){
    return cp5;
  }
  
  public void setToolPointSelected(ToolPoint tP){
    this.tpSelected = tP;
  }
  
  private void createButtons(){
    // Tool points
    createToolPoints();
    // TODO: ubicación
    // TODO: play
  }
  
  private void createToolPoints(){
    toolPoints = new ArrayList<ToolPoint>();
    toolPoints.add(new BigPoint(this));
    toolPoints.add(new MediumPoint(this));
    toolPoints.add(new SmallPoint(this));
  }
}

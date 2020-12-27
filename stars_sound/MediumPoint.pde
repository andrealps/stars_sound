public class MediumPoint extends ToolPoint {
  public MediumPoint(Main main){
    super(main);
  }
  
  @Override
  public void createPoint(){
    image = loadImage("data/ToolPoint/medium.png");
    
    main.getControlP5().addButton("medium")
     .setValue(1)
     .setPosition(70, 12)
     .onClick(listener)
     .setImages(image, image, image)
     .updateSize();     
     ;
  }
  
  @Override
  public int getSize(){ return 35; }
}

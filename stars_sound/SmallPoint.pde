public class SmallPoint extends ToolPoint {
  public SmallPoint(Main main){
    super(main);
  }
  
  @Override
  public void createPoint(){
    image = loadImage("data/ToolPoint/small.png");
    
    main.getControlP5().addButton("small")
     .setValue(2)
     .setPosition(115, 19)
     .onClick(listener)
     .setImages(image, image, image)
     .updateSize();     
     ;
  }
  
  @Override
  public int getSize(){ return 20; }
}

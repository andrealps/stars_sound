public class SmallPoint extends ToolPoint {
  public SmallPoint(Main main){
    super(main);
  }
  
  @Override
  public void createPoint(){
    image = loadImage("data/small.png");
    
    main.getControlP5().addButton("small")
     .setValue(2)
     .setPosition(115, 24)
     .onClick(listener)
     .setImages(image, image, image)
     .updateSize();     
     ;

  }
}

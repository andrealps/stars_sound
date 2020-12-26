public class MediumPoint extends ToolPoint {
  public MediumPoint(Main main){
    super(main);
  }
  
  @Override
  public void createPoint(){
    image = loadImage("data/medium.png");
    
    main.getControlP5().addButton("medium")
     .setValue(1)
     .setPosition(70, 17)
     .onClick(listener)
     .setImages(image, image, image)
     .updateSize();     
     ;

  }
}

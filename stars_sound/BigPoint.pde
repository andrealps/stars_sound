public class BigPoint extends ToolPoint {
  public BigPoint(Main main){
    super(main);
  }
  
  @Override
  public void createPoint(){
    image = loadImage("data/big.png");
    
    main.getControlP5().addButton("big")
     .setValue(0)
     .setPosition(10, 10)
     .onClick(listener)
     .setImages(image, image, image)
     .updateSize();     
     ;

  }
}

public class DeleteButton extends InterfaceButton {
  public DeleteButton(Main main){
    super(main);
  }
  
  @Override
  public void createButton(){
    image = loadImage("data/InterfaceButtons/delete.png");
     
    main.getControlP5().addButton("delete")
     .setValue(2)
     .setPosition(800, 15)
     .onClick(listener)
     .setImages(image, image, image)
     .updateSize();
     ;
  }
  
  @Override
  public void doOnClick(){
    main.deleteLastStar();
  }
}

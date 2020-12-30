public class PlayButton extends InterfaceButton {
  public PlayButton(Main main){
    super(main);
  }
  
  @Override
  public void createButton(){
    image = loadImage("data/InterfaceButtons/play.png");
     
    main.getControlP5().addButton("play")
     .setValue(2)
     .setPosition(750, 15)
     .onClick(listener)
     .setImages(image, image, image)
     .updateSize();
     ;
  }
  
  @Override
  public void doOnClick(){
    main.play();
  }

}

public class UploadButton extends InterfaceButton {
  public UploadButton(Main main){
    super(main);
  }
  
  @Override
  public void createButton(){
    image = loadImage("data/InterfaceButtons/upload.png");
     
    main.getControlP5().addButton("upload")
     .setValue(2)
     .setPosition(850, 15)
     .onClick(listener)
     .setImages(image, image, image)
     .updateSize();
     ;
  }
  
  @Override
  public void doOnClick(){
    selectInput("Elige una imagen para el fondo:", "fileSelected", null, this);
  }
  
  public void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
    
  } else {
    String path = selection.getAbsolutePath();
    println("User selected " + path);
    
    if (isValidImage(path)) {
      PImage image = loadImage(path);
      main.changeBackgroundImage(image);
      println("Background image changed " + path);
    }
  }
  }
  
  
  boolean isValidImage(String pathImagen){
    return pathImagen.toLowerCase().endsWith(".jpg") 
    || pathImagen.toLowerCase().endsWith(".jpeg") 
    || pathImagen.toLowerCase().endsWith(".png");
  }

}

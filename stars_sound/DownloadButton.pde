public class DownloadButton extends InterfaceButton {
  public DownloadButton(Main main) {
    super(main);
  }

  @Override
    public void createButton() {
    image = loadImage("data/InterfaceButtons/download.png");

    main.getControlP5().addButton("download")
      .setValue(2)
      //TODO Cambiar posicion
      .setPosition(850, 15)
      .onClick(listener)
      .setImages(image, image, image)
      .updateSize();
    ;
  }

  @Override
    public void doOnClick() {
    selectOutput("Indica el nombre y ubicación del archivo:", "fileSelected", null, this);
  }

  public void fileSelected(File selection) {
    if (selection == null) {
      println("Window was closed or the user hit cancel.");
    } else {
      String path = selection.getAbsolutePath();
      println("User selected " + path);
      main.saveFile(path);
      println("Fichero guardado " + path);
    }
  }
}

public class Main {
  private PApplet app;
  private ControlP5 cp5;

  // Title
  private PFont fontTitle;
  private PImage iconTitle;

  // Points for drawing 
  private ArrayList<ToolPoint> toolPoints;
  private ToolPoint tpSelected;

  // Interface buttons
  private ArrayList<InterfaceButton> interfaceButtons;

  // Canvas 
  private CanvasStars canvas;

  public Main(PApplet app) {
    this.app = app;
    this.cp5 = new ControlP5(app);
  }

  // Called by setUp
  public void run() {
    // Create buttons
    createButtons();
    // Create canvas
    createCanvas();

    fontTitle = loadFont("StarsSoundFont.vlw");
    iconTitle = loadImage("musical-notes.png");
  }

  // Called by draw
  public void update() {
    canvas.draw(this);
    // Show Title
    showTitle();
  }

  public ControlP5 getControlP5() { 
    return cp5;
  }
  public PApplet getApp() { 
    return app;
  }
  public ToolPoint getTPSelected() { 
    return tpSelected;
  }

  /****************************** TITLE *********************************/
  private void showTitle() {
    // Show "Stars Sound"
    showTextTitle();
    // Show musical notes icon
    showIconTitle();
  }

  private void showTextTitle() {
    fill(#C7D9FC);
    textFont(fontTitle);
    textSize(35);
    text("Stars Sound", 290, 43);
  }

  private void showIconTitle() {
    imageMode(CENTER);
    image(iconTitle, 530, 32);
  }

  /****************************** CANVAS ********************************/
  private void createCanvas() {
    canvas = new CanvasStars();
  }

  public void changeBackgroundImage(PImage image) {
    canvas.setBackgroundImage(image);
  }

  public void deleteLastStar() {
    canvas.deleteLastStar();
  }

  /****************************** BUTTONS ********************************/
  private void createButtons() {
    // Tool points
    createToolPoints();
    // Interface buttonsz
    createInterfaceButtons();
  }  

  /********* Tool points ************/
  private void createToolPoints() {
    toolPoints = new ArrayList<ToolPoint>();
    toolPoints.add(new BigPoint(this));
    toolPoints.add(new MediumPoint(this));
    toolPoints.add(new SmallPoint(this));

    setToolPointSelected(toolPoints.get(0));
  }

  public void setToolPointSelected(ToolPoint tP) {
    this.tpSelected = tP;
  }

  /********* Interface buttons ************/
  private void createInterfaceButtons() {
    interfaceButtons = new ArrayList<InterfaceButton>();
    // Upload button (image)
    interfaceButtons.add(new UploadButton(this));
    // Delete button
    interfaceButtons.add(new DeleteButton(this));
    // TODO: download button (Ruby textfile)
    interfaceButtons.add(new DownloadButton(this));
    interfaceButtons.add(new PlayButton(this));
  }

  /******** Send notes to Sonic pi ********/
  void sendMessageToSP(float size, int time) {
    OscMessage messageToSend = new OscMessage("/message");
    messageToSend.add(size); 
    messageToSend.add((float)time); 
    oscP5.send(messageToSend, sonicPi);
    println(messageToSend);
    try {
      Thread.sleep(time);//Wait until the note is already played
    }
    catch(Exception e) {
    }
  }

  /****************************** PLAY ********************************/
  public void play() {
    StarsManager st = StarsManager.getInstance();
    boolean isFirst=true;
    Star lastStar=null;
    for (int i=0; i<5; i++) {
      for (Star s : st.getStars()) {
        if (isFirst) {
          isFirst=false;
          lastStar=s;
          sendMessageToSP(s.getSize(), 300);
        } else {
          int distance=calculateDistanceBetweenTwoStars(lastStar, s);
          System.out.println("Distance: "+distance);
          int time=normalize(distance);
          System.out.println("Time: "+time);
          sendMessageToSP(s.getSize(), time);
          lastStar=s;
        }
      }
      try {
        Thread.sleep(500);//Wait until the note is already played
      }
      catch(Exception e) {
      }
    }
  }

  /** Método auxiliar para obtener la cabecera Ruby que tocará la melodía ******/
  private String getCabecera() {
    StringBuilder cabecera = new StringBuilder();
    cabecera.append("\r\nuse_bpm 10000");
    cabecera.append("\r\nuse_synth :piano");
    cabecera.append("\r\nmy_melody.each_with_index do |elemento, index|");
    cabecera.append("\r\n  play hz_to_midi(elemento), release:my_sleep[index], amp:1");
    cabecera.append("\r\n  sample :ambi_piano, amp:0.1, release:my_sleep[index]");
    cabecera.append("\r\n  sleep(my_sleep[index]/2)");
    cabecera.append("\r\nend");
    return cabecera.toString();
  }

  /****************************** SAVE ********************************/
  public void saveFile(String path) {
    StarsManager st = StarsManager.getInstance();
    StringBuilder content = new StringBuilder();
    StringBuilder notas = new StringBuilder();
    StringBuilder pausa = new StringBuilder();
    notas.append("my_melody = [");
    pausa.append("my_sleep = ["); 

    boolean isFirst=true;
    Star lastStar=null;
    for (int i=0; i<5; i++) {
      for (Star s : st.getStars()) {
        if (isFirst) {
          isFirst=false;
          lastStar=s;
          float notaInsertar=0.0;
          if(s.getSize()==50)
            notaInsertar=261.63;
          else if(s.getSize()==35)
            notaInsertar=329.628;
          else if(s.getSize()==20)
            notaInsertar=391.995;
          notas.append(""+notaInsertar+",");
          pausa.append("300,");
        } else {
          int distance=calculateDistanceBetweenTwoStars(lastStar, s);
          System.out.println("Distance: "+distance);
          int time=normalize(distance);
          float notaInsertar=0.0;
          if(s.getSize()==50)
            notaInsertar=261.63;
          else if(s.getSize()==35)
            notaInsertar=329.628;
          else if(s.getSize()==20)
            notaInsertar=391.995;
          //notas.append(""+s.getSize()+",");
          notas.append(""+notaInsertar+",");
          pausa.append(""+time+",");
          lastStar=s;
        }
      }
    }
    content.append((notas.length()>13) ? notas.toString().substring(0, notas.length()-1) : "");
    content.append("]");

    content.append("\r\n");
    content.append((pausa.length()>13) ? pausa.toString().substring(0, pausa.length()-1) : "");
    content.append("]");
    
    content.append(getCabecera());
    
    try {
      FileWriter myWriter = new FileWriter(path);
      myWriter.write(content.toString());
      myWriter.close();
    } catch (IOException e) {
      System.out.println("Error al guardar el archivo:"+ path);
      e.printStackTrace();
    }
  }
  /**
   * Accepts values between 0 and 1040 (Possible distances between stars)
   * Returns values between 100 and 400 (Possible sound durations)
   */
  public int normalize(int num) {
    return 100+(int)((num/(1040.0))*500);
  }

  public int calculateDistanceBetweenTwoStars(Star s1, Star s2) {
    int x1=s1.getX();
    int x2=s2.getX();
    int y1=s1.getY();
    int y2=s2.getY();
    return (int)Math.sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1));
  }
}

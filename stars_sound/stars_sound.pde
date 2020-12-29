import controlP5.*;
Main mainR;

//Play sounds
import processing.sound.*;
public SoundFile doNote;
public SoundFile miNote;
public SoundFile solNote;

void setup() {
  size(900, 600);
  surface.setTitle("Stars Sound");
  surface.setIcon(loadImage("data/icon.png"));
  
  //Play sounds
  doNote = new SoundFile(this,"do.mp3");
  miNote = new SoundFile(this,"mi.mp3");
  solNote = new SoundFile(this,"sol.mp3");

  mainR = new Main(this);
  mainR.run();
}

void draw() {
  mainR.update();
}

public SoundFile getDo(){
  return doNote;
}
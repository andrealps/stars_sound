import controlP5.*;
import oscP5.*; 
import netP5.*;

Main mainR;
OscP5 oscP5;
NetAddress sonicPi;

void setup() {
  size(900, 600);
  surface.setTitle("Stars Sound");
  surface.setIcon(loadImage("data/icon.png"));
  
  //SonicPi Connection
  oscP5 = new OscP5(this, 64605);
  sonicPi = new NetAddress("127.0.0.1",4560);

  mainR = new Main(this);
  mainR.run();
}

void draw() {
  mainR.update();
}


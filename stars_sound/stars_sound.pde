import controlP5.*;

Main mainR;

void setup() {
  size(900, 600);
  surface.setTitle("Stars Sound");
  
  mainR = new Main();
  mainR.run(new ControlP5(this));
}

void draw() {
  background(20);
}

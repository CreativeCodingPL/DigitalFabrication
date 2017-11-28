import hpglgraphics.*;
HPGLGraphics canvas; //deklaracja HPGLGraphics

boolean record = false; //boolean posluzy do uruchamiania eksportu

void setup() {
  size(1104, 772);
  canvas = (HPGLGraphics) createGraphics(width, height, HPGLGraphics.HPGL);
  canvas.setPaperSize("A4");
  canvas.setPath("output.plt");
}

void draw() {
  background(255);
  rectMode(CENTER); //rysowanie kwadratu od środka
  noFill();
  
  if (record == true) {
    beginRecord(canvas);
  }
  
  
  if (record == true) {
    endRecord();
    print("eksport ok!");
    record=false;
  }
}

void keyPressed() {
  record = true;
}
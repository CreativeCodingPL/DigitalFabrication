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

  float a = 0.0;
  float inc = TWO_PI/25.0;

  int valMax = height;
  int valWidth = width;
  int valStep = 10;
  int valMult = 25;

  for (int i = 0; i < valMax; i=i+valStep) {
    line(0, i+sin(a)*valMult, valWidth, i+sin(a)*valMult);
    a = a + inc;
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
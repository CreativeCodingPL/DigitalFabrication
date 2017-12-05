import hpglgraphics.*;
HPGLGraphics canvas; //deklaracja HPGLGraphics

boolean record = false; //boolean posluzy do uruchamiania eksportu

import processing.video.*;

Capture kamera;

void setup() {
  size(1104, 772);

  kamera = new Capture(this, 1104, 772); //zmiana wielkosci kamery

  kamera.start();

  canvas = (HPGLGraphics) createGraphics(width, height, HPGLGraphics.HPGL);
  canvas.setPaperSize("A4");
  canvas.setPath("output.plt");
}

void draw() {
  rectMode(CENTER); //kwadrat zlokalizowany w centrum
  stroke(255); //stroke na bialo

  if (kamera.available()) {
    if (record == true) {
      beginRecord(canvas);
      noFill();
    }

    kamera.read(); 
    background(0);
    for (int x=0; x<width; x = x + 20) {
      for (int y=0; y<height; y = y + 20) {
        color c = kamera.get(x, y);
        float b = brightness(c);
        fill(b);
        rect(x, y, b*0.07, b*0.07); //zmiana mnoznika z 0.1 na mniejszy
      }
    }

    if (record == true) {
      endRecord();
      print("eksport ok!");
      record=false;
    }
  }
}

void keyPressed() {
  record = true;
}
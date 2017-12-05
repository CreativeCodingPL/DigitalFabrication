import hpglgraphics.*;
HPGLGraphics canvas; //deklaracja HPGLGraphics

boolean record = false; //boolean posluzy do uruchamiania eksportu

PImage img; //deklaracja obrazka

void setup() {
  size(1104, 772);

  img = loadImage("zorza.jpg");

  canvas = (HPGLGraphics) createGraphics(width, height, HPGLGraphics.HPGL);
  canvas.setPaperSize("A4");
  canvas.setPath("output.plt");
}

void draw() {
  rectMode(CENTER); //kwadrat zlokalizowany w centrum
  stroke(255); //stroke na bialo
  
  image(img,0,0);

  if (record == true) {
    beginRecord(canvas);
  }

  for (int x=0; x<width; x = x + 10) {
    for (int y=0; y<height; y = y + 10) {
      color c = get(x, y);
      float b = green(c); //test hue, saturation. brightness, red, green, blue
      fill(b);
      rect(x, y, b*0.03, b*0.03); //zmiana mnoznika z 0.1 na mniejszy
    }
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
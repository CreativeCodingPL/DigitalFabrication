import processing.video.*;

Capture kamera;

void setup() {
  size(640, 480);

  kamera = new Capture(this, 640, 480);

  kamera.start();
}

void draw() {
  rectMode(CENTER); //kwadrat zlokalizowany w centrum
  stroke(255); //stroke na bialo
  
  if (kamera.available()) {
    kamera.read(); 
    background(0);
    for (int x=0; x<width; x = x + 20) {
      for (int y=0; y<height; y = y + 20) {
        color c = kamera.get(x, y);
        float b = brightness(c);
        
        //zmiany przy fill i stroke
        fill(b);
        //noFill();
        //noStroke();
        
        rect(x, y, b*0.07, b*0.07);
      }
    }
  }
}
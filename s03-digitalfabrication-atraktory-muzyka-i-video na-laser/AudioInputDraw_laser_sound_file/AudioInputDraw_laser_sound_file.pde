import hpglgraphics.*;
HPGLGraphics canvas; //deklaracja HPGLGraphics

boolean record = false; //boolean posluzy do uruchamiania eksportu

import processing.sound.*;

AudioIn mikrofon;
Amplitude natezenie;

SoundFile muza;

int locX = 25;
int locFrameCount = 0;
int locY = 50; //lokalizacja w Y, bedzie sie stopniowo obnizac

int []arrayX = new int[309];
int []arrayY = new int[309];
float []rad = new float[309];

void setup() {
  size(1104, 772, P3D); //rozmiar na laser                            
  background(255);

  mikrofon = new AudioIn(this, 0);

  mikrofon.start();

  natezenie = new Amplitude(this);

  natezenie.input(mikrofon);

  canvas = (HPGLGraphics) createGraphics(width, height, HPGLGraphics.HPGL);
  canvas.setPaperSize("A4");
  canvas.setPath("output.plt");

  frameRate(30);

  muza = new SoundFile(this, "vibraphon.aiff");
  muza.loop();
}      


void draw() {
  if (frameCount < 309) { //zapisujemy tylko pierwsze 309 klatek
    stroke(0, 40);
    strokeWeight(1);
    fill(255, 0, 150);
    float rozmiar = natezenie.analyze()*300;
    if (rozmiar < 5) rozmiar = 5; //5 jesli bedzie cisza
    ellipse(locX, locY, rozmiar, rozmiar*1.01); //nie idealne kolo żeby było ok na laser

    //zapisujemy lokalizacje i wielkosc okregu do zdeklarowanej wczesniej tablicy
    //w kazdej kolejne klatce (mniejszej niz 309)
    arrayX[frameCount]=locX;
    arrayY[frameCount]=locY;
    rad[frameCount]=rozmiar;

    locFrameCount += 1; 
    locX = locX + 50;

    if (frameCount % 22 == 0) { //kolejna linijka co 22 klatki
      locX = 25; //wracamy do poczarku rzedu w X
      locFrameCount = 0;
      locY += 50; //zaczynamy nastepny rzad w Y
    }

    println("frame: " + frameCount + " locX: " + locX + " locY: " + locY);
  } else {
    print("odtwarzanie zapisanych ");

    if (record == true) {
      beginRecord(canvas);
      noFill();
    }

    for (int i=0; i<309; i++) {
      ellipse(arrayX[i], arrayY[i], rad[i], rad[i]*1.01);
    }

    if (record == true) {
      endRecord();
      print("eksport ok!");
      record=false;
    }
  }
}

void keyPressed() {
  // Use a key press so that it doesn't make a million files
  if (key == 'r') {
    record = true;
  }
}
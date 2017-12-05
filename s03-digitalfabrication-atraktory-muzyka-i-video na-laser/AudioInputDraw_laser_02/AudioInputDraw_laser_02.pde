import hpglgraphics.*;
HPGLGraphics canvas; //deklaracja HPGLGraphics

boolean record = false; //boolean posluzy do uruchamiania eksportu

import processing.sound.*;

AudioIn mikrofon;
Amplitude natezenie;

int locX = 25;
int locFrameCount = 0;
int locY = 50; //lokalizacja w Y, bedzie sie stopniowo obnizac

void setup() {
  size(1104, 772); //rozmiar na laser                            
  background(255);

  mikrofon = new AudioIn(this, 0);

  mikrofon.start();

  natezenie = new Amplitude(this);

  natezenie.input(mikrofon);
  
  background(255, 255, 255);
  
  canvas = (HPGLGraphics) createGraphics(width, height, HPGLGraphics.HPGL);
  canvas.setPaperSize("A4");
  canvas.setPath("output.plt");
  
  frameRate(15);
}      


void draw() {
  stroke(0, 40);
  strokeWeight(1);
  fill(255, 0, 150);
  float rozmiar = natezenie.analyze()*300;
  //line(frameCount % width, height/2 - rozmiar, frameCount % width, height/2 + rozmiar);
  if (rozmiar < 5) rozmiar = 5; //5 jesli bedzie cisza
  ellipse(locX, locY, rozmiar, rozmiar*1.01); //nie idealne kolo żeby było ok na laser
  
  locFrameCount += 1; 
  locX = locX + 50;
  
  if (frameCount % 22 == 0){ 
    locX = 25; //wracamy do poczarku rzedu w X
    locFrameCount = 0;
    locY += 50; //zaczynamy nastepny rzad w Y
  }
  
  println("frame: " + frameCount + " locX: " + locX + " locY: " + locY);
}
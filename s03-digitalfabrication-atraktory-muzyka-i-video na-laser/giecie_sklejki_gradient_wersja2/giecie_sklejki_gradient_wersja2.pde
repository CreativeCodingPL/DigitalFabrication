import hpglgraphics.*;
HPGLGraphics canvas; //deklaracja HPGLGraphics

int numX = 10;
int numY = 20;

boolean record = false; //boolean posluzy do uruchamiania eksportu

int sizeX = 800;
int sizeY = 800;

void setup() {
  size(1544, 1104); //1544 = 2*772

  canvas = (HPGLGraphics) createGraphics(width, height, HPGLGraphics.HPGL);
  canvas.setPaperSize("A4");
  canvas.setPath("output.plt");
}

void draw() {

  int centerX = sizeX/2;
  int centerY = sizeY/2;

  int szerokosc = 42;
  int wysokosc = 5;

  background(255);
  rectMode(CENTER); //rysowanie kwadratu od środka
  noFill();

  if (record == true) {
    beginRecord(canvas);
  }

  for (int i=25; i<sizeX; i+=50) {
    for (int j=10; j<sizeY; j+=20) { //sizeY-5

      float distance = dist(i, j, 400, 400);
      float factor = map(distance, 0, 500, 1.0, 0.5);

      //rect(i, j, szerokosc, wysokosc);
      rect(i, j, szerokosc*factor, wysokosc*factor);

      if (j<sizeY-20) { //uzuniecie ostatniego rzedu na dole 
        if (i<sizeX-30) { //usuniecie ostatniego prostokata pod koniec
          rect(i+25, j+10, szerokosc*factor, wysokosc*factor);
          //rect(i+25, j+10, szerokosc, wysokosc);
        }
      }
    }
  }
  rect(0, 0, sizeX*2, sizeY*2);

  fill(255, 0, 0, 100); //fill z przerzoczystoscia
  noStroke();
  ellipse(centerX, centerY, 40, 40);
  stroke(0);


  if (record == true) {
    endRecord();
    print("eksport ok!");
    record=false;
  }

  noLoop();
}

void keyPressed() {
  record = true;
}
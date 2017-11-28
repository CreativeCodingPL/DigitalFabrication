import hpglgraphics.*;
HPGLGraphics canvas; //deklaracja HPGLGraphics

int numX = 10;
int numY = 20;

boolean record = false; //boolean posluzy do uruchamiania eksportu

int sizeX = 400;
int sizeY = 600;

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

  int dlugosc1 = 10; //przetestujcie zmianę na 15
  int dlugosc2 = 5; //przetestujcie zmianę na 10
  int wysokosc = 5; //przetestujcie zmianę na 10
  int dodaci = int(map(mouseX,0,width,5,30)); 
  int dodacj = int(map(mouseY,0,height,5,30));

  for (int i=25; i<sizeX; i+=50) {
    for (int j=10; j<sizeY-5; j+=20) { 

      if (j<100 || j>250 && j<350 || j>450) { //this is a new line

        line(i-dlugosc1-dlugosc2, j-wysokosc, i-dlugosc1, j); //linia skosna do gory na poczatku linii pionowej
        line(i-dlugosc1-dlugosc2, j+wysokosc, i-dlugosc1, j); //linia skosna do gory na poczatku linii pionowej
        line(i-dlugosc1, j, i+dlugosc1, j); //linia pionowa
        line(i+dlugosc1+dlugosc2, j-wysokosc, i+dlugosc1, j); //linia skosna do gory na poczatku linii pionowej
        line(i+dlugosc1+dlugosc2, j+wysokosc, i+dlugosc1, j); //linia skosna do gory na poczatku linii pionowej

        line(i-dlugosc1-dlugosc2+dodaci, j-wysokosc+dodacj, i-dlugosc1+dodaci, j+dodacj); //linia skosna do gory na poczatku linii pionowej
        line(i-dlugosc1-dlugosc2+dodaci, j+wysokosc+dodacj, i-dlugosc1+dodaci, j+dodacj); //linia skosna do gory na poczatku linii pionowej
        line(i-dlugosc1+dodaci, j+dodacj, i+dlugosc1+dodaci, j+dodacj); //linia pionowa
        line(i+dlugosc1+dlugosc2+dodaci, j-wysokosc+dodacj, i+dlugosc1+dodaci, j+dodacj); //linia skosna do gory na poczatku linii pionowej
        line(i+dlugosc1+dlugosc2+dodaci, j+wysokosc+dodacj, i+dlugosc1+dodaci, j+dodacj); 

        if (i==25) { //dodatkowa kolumna na samym poczatku
          line(i-dlugosc1-dlugosc2-dodaci, j-wysokosc+dodacj, i-dlugosc1-dodaci, j+dodacj); //linia skosna do gory na poczatku linii pionowej
          line(i-dlugosc1-dlugosc2-dodaci, j+wysokosc+dodacj, i-dlugosc1-dodaci, j+dodacj); //linia skosna do gory na poczatku linii pionowej
          line(i-dlugosc1-dodaci, j+dodacj, i+dlugosc1-dodaci, j+dodacj); //linia pionowa
          line(i+dlugosc1+dlugosc2-dodaci, j-wysokosc+dodacj, i+dlugosc1-dodaci, j+dodacj); //linia skosna do gory na poczatku linii pionowej
          line(i+dlugosc1+dlugosc2-dodaci, j+wysokosc+dodacj, i+dlugosc1-dodaci, j+dodacj);
        }
      }
    }
  }
  rect(0, 0, sizeX*2, sizeY*2);

  if (record == true) {
    endRecord();
    print("eksport ok!");
    record=false;
  }
}

void keyPressed() {
  record = true;
}
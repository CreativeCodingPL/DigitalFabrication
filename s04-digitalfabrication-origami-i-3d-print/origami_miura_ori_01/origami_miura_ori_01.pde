int stepX = 20;
int stepY = 5;

int [] mult = {0, 1, -3, 4, -1, 4, -2, 3, -1};

void setup() {
  size(500, 500);
}

void draw() {

  noFill();

  pushMatrix();
  translate(0, 20); 

  beginShape();
  int locX = 0;
  int locY = 0;
  vertex(locX, locY);
  locX += stepX*abs(mult[1]);
  locY += stepY*mult[1];
  vertex(locX, locY);
  locX += stepX*abs(mult[2]);
  locY += stepY*mult[2];
  vertex(locX, locY);
  locX += stepX*abs(mult[3]);
  locY += stepY*mult[3];
  vertex(locX, locY);
  locX += stepX*abs(mult[4]);
  locY += stepY*mult[4];
  vertex(locX, locY);
  locX += stepX*abs(mult[5]);
  locY += stepY*mult[5];
  vertex(locX, locY);
  locX += stepX*abs(mult[6]);
  locY += stepY*mult[6];
  vertex(locX, locY);
  locX += stepX*abs(mult[7]);
  locY += stepY*mult[7];
  vertex(locX, locY);

  endShape();

  popMatrix();
}
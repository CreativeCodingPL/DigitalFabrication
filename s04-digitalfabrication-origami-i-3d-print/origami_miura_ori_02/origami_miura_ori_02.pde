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

  int locX = 0;
  int locY = 0;
  beginShape();
  for (int i=0; i<mult.length-1; i++) {
    vertex(locX, locY);
    locX += stepX*abs(mult[i]);
    locY += stepY*mult[i];
  }
  endShape();


  popMatrix();
}
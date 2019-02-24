int stepX = 20;
int stepY = 5;

int [] move = {0, 1, -3, 4, -1, 4, -2, 3, -1, 2, -2, 4, -4, 2, -1};

int locX;
int locY;

void setup() {
  size(500, 500);
}

void draw() {
  background(255);

  if (keyPressed) {
  }

  noFill(); 

  locX = 0;
  locY = 0;

  for (int j=0; j<20; j++) {
    if (j%2 == 0) stroke(255, 0, 0);
    else stroke(0, 0, 255);

    locX = 0;
    locY = j*(20);

    beginShape();
    for (int i=0; i<move.length-1; i++) {
      vertex(locX, locY);
      locX += stepX*abs(move[i]);
      locY += stepY*move[i];

      if (i%2 == 0) line(locX, locY, locX, locY-20);
      else line(locX, locY, locX, locY+20);
    }
    endShape();
  }
}

void keyPressed() {
  for (int i=0; i<move.length; i++) {
    if (i%2 == 0) move[i] = -int(random(1, 4));
    else move[i] = int(random(1, 4));
  }
}
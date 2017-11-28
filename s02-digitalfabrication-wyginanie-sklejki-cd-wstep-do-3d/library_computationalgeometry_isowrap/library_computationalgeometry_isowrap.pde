import ComputationalGeometry.*;

IsoWrap wrap;

int len = 100;

void setup() {

  size(500, 500, P3D);

  wrap = new IsoWrap(this);

  // Add points
  for (int i=0; i<len; i++) {
    wrap.addPt(new PVector(random(-100, 100), random(-100, 100), random(-100, 100) ) );
  }
}

void draw() {

  background(220);
  lights();  
  float zm = 250;
  float sp = 0.01 * frameCount;
  camera(zm * cos(sp), zm * sin(sp), zm, 0, 0, 0, 0, 0, -1);

  fill(255, 255, 0);
  stroke(100);
  wrap.plot();
}


void mousePressed() { //nowy ksztalt jesli mouse pressed
  wrap = new IsoWrap(this);
  
  for (int i=0; i<len; i++) {
    wrap.addPt(new PVector(random(-50, 100), random(-100, 100), random(-100, 100) ) );
  }
}
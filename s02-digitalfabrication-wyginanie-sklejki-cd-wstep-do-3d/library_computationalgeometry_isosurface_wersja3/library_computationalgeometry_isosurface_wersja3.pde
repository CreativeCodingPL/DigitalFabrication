import ComputationalGeometry.*;
IsoSurface iso;

void setup() {

  size(500, 500, P3D);

  // Creating the Isosurface
  // ! mozecie kontrolowac gestosc isosurface zmieniajac ostatni parametr
  iso = new IsoSurface(this, new PVector(0, 0, 0), new PVector(100, 100, 100), 8);

  // Adding Data to the Isosurface

  for (int i=0; i<30; i++) {
    PVector pt = new PVector( random(100), random(100), random(100) );
    iso.addPoint(pt);
  }
}
void draw() {

  camera(150, 150, 150, 50, 50, 40, 0, 0, -1);
  lights();
  background(220);

  // Plot Voxel Space
  // mozecie wylaczyc ten fragment jesli chcecie widziec sama geometrie
  noFill();
  stroke(0, 1);
  iso.plotVoxels();

  // Plot Surface at a Threshold
  fill(255, 255, 0);
  iso.plot(mouseX/10000.0);
}

void keyPressed() {
  iso.clear(); //usuwamy poprzednie punkty
  for (int i=0; i<30; i++) {
    PVector pt = new PVector( random(100), random(100), random(100) );
    iso.addPoint(pt);
  }
}
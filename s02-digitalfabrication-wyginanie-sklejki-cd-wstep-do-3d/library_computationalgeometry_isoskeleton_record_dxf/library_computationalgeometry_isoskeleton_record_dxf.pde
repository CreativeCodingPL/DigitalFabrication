import ComputationalGeometry.*;
IsoSkeleton skeleton;

import processing.dxf.*;
boolean record = false;

void setup() {
  size(250, 250, P3D);

  // Create iso-skeleton
  skeleton = new IsoSkeleton(this);

  // Create points to make the network
  PVector[] pts = new PVector[100];
  for (int i=0; i<pts.length; i++) {
    pts[i] = new PVector(random(-100, 100), random(-100, 100), random(-100, 100) );
  }  

  for (int i=0; i<pts.length; i++) {
    for (int j=i+1; j<pts.length; j++) {
      if (pts[i].dist( pts[j] ) < 50) {
        skeleton.addEdge(pts[i], pts[j]);
      }
    }
  }
}

void draw() {

  if (record) {
    beginRaw(DXF, "output.dxf");
  }

  background(220);
  lights();  
  float zm = 150;
  float sp = 0.001 * frameCount;
  camera(zm * cos(sp), zm * sin(sp), zm, 0, 0, 0, 0, 0, -1);

  noStroke();
  skeleton.plot(10.f * float(mouseX) / (2.0f*width), float(mouseY) / (2.0*height));  // Thickness as parameter

  if (record) {
    endRaw();
    record = false;
  }
}

void keyPressed() {
  // Use a key press so that it doesn't make a million files
  if (key == 'r') {
    record = true;
  }
}
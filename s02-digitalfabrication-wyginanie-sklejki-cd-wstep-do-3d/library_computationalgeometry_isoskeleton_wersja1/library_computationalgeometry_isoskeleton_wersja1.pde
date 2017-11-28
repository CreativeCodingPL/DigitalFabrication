import ComputationalGeometry.*;
IsoSkeleton skeleton;

void setup() {
  size(250, 250, P3D);

  // Create iso-skeleton
  skeleton = new IsoSkeleton(this);

  // Create points to make the network
  PVector[] pts = new PVector[5];
  //for (int i=0; i<pts.length; i++) {
  
  ///*
  pts[0] = new PVector(0, 0, 0);
  pts[1] = new PVector(0, 100, 0);
  pts[2] = new PVector(0, 100, 100);
  pts[3] = new PVector(100, 100, 100);
  pts[4] = new PVector(0, 0, 0);
  //*/

  for (int i=0; i<pts.length; i++) {
    for (int j=i+1; j<pts.length; j++) {
      if (pts[i].dist( pts[j] ) < 200) {
        skeleton.addEdge(pts[i], pts[j]);
      }
    }
  }
}

void draw() {
  background(220);
  lights();  
  float zm = 150;
  float sp = 0.001 * frameCount;
  camera(zm * cos(sp), zm * sin(sp), zm, 0, 0, 0, 0, 0, -1);
  
  noStroke();
  skeleton.plot(10.f * float(mouseX) / (2.0f*width), float(mouseY) / (2.0*height));  // Thickness as parameter
}
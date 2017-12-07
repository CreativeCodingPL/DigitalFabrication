import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.geom.mesh.subdiv.*;
import toxi.processing.*;
import toxi.util.*;

ToxiclibsSupport gfx;

WETriangleMesh mesh;

int CYLINDER_RES = 7;

void setup() {
  size(800, 600, P3D);
  smooth(8);
  gfx=new ToxiclibsSupport(this);
}

void draw() {
  background(255);
  lights();
  translate(width / 2, height / 2, 0);
  rotateX(mouseY * 0.01);
  rotateY(mouseX * 0.01);

  mesh = new WETriangleMesh();
  //dwa pierwsze Vec 3d to orientacja: punkt początkowy i wektor kierunku bryły
  //następne wartości to średnica na górze, średnica na dole, wysokość
  //toMesh (przypisana przez nas nazwa siatki, ilość boków w podstawie , zaknięcie na dole, zamknięcie na górze)
  //Cone w Tovic Libs: http://toxiclibs.org/docs/p5/toxi/processing/ToxiclibsSupport.html#cone(toxi.geom.Cone)

  new Cone(new Vec3D(0, 0, 0), new Vec3D(1, 0, 0), 100, 200, 300).toMesh(mesh, CYLINDER_RES, 0, true, true);

  gfx.mesh(mesh, false);
}

void keyPressed() {
  if (key == ' ') {
    mesh.saveAsSTL(sketchPath(DateUtils.timeStamp()+".stl"));
    println("STL saved");
  }
}
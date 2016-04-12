
float w = 100;
float h = 100;
float d = 100;

PVector lightBox = new PVector(w, h, d);
PVector oceanBlue = new  PVector(28, 107, 160);
PVector sandyBottom = new PVector(194, 178, 128);
PVector Ground = new PVector(w, 2, d);

Camera cam = new Camera();

ReefGrowth reef = new ReefGrowth(new PVector(0,0), 2);

void setup()
{
  size(800, 500, P3D);
}

void draw()
{
  background(oceanBlue.x, oceanBlue.y, oceanBlue.z);
  
  //World
  cam.update();
  pushMatrix();
  translate(0, 0, 400);
  noFill();
  stroke(255);
  box(w, h, d);
  translate(0, 49, 0);
  fill(sandyBottom.x, sandyBottom.y, sandyBottom.z);
  box(Ground.x, Ground.y, Ground.z);
  popMatrix();
  
  reef.grow();
  reef.drawCoral(reef.radius);
}
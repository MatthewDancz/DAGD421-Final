
float w = 100;
float h = 100;
float d = 100;

PVector v = new  PVector(28, 107, 160);

Camera cam = new Camera();

void setup()
{
  size(800, 500, P3D);
}

void draw()
{
  background(v.x, v.y, v.z);
  
  cam.update();
  pushMatrix();
  translate(0, 0, 400);
  noFill();
  stroke(255);
  box(w, h, d);
  popMatrix();
}
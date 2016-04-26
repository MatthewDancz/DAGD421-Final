
Reef r = new Reef(new PVector(0, 0, 0), 200, random(10, 50));

float angle = 0;

void setup()
{
  size(800, 800, P3D);
  r.populateReef();
}

void draw()
{
  background(125);
  
  pushMatrix();
  translate(width/2, height/2);
  rotateX(angle);
  rotateY(angle);
  r.drawReef();
  popMatrix();
  
  angle += .01;
}
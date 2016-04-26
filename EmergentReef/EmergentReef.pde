
PVector lightBox = new PVector(1000, 1000, 1000);
PVector oceanBlue = new  PVector(28, 107, 160);
PVector sandyBottom = new PVector(194, 178, 128);
PVector Ground = new PVector(1000, 2, 1000);

Camera cam = new Camera();

Reef r = new Reef(new PVector(0,0,0), 500, random(10, 50));

SchoolOfFish coolfish = new SchoolOfFish(1000);

PShader texShader;

void setup()
{
  size(800, 500, P3D);
  r.populateReef();
  coolfish.fishsetup();
}

void draw()
{
  background(oceanBlue.x, oceanBlue.y, oceanBlue.z);
  
  //World
  cam.update();
  pushMatrix();
  translate(-500, -500, 350);
  coolfish.fishdraw();
  translate(500, 500, 500);
  noFill();
  stroke(255);
  box(lightBox.x, lightBox.y, lightBox.z);
  translate(0, 495, 0);
  r.drawReef();
  translate(0, 7, 0);
  fill(sandyBottom.x, sandyBottom.y, sandyBottom.z);
  box(Ground.x, Ground.y, Ground.z);
  popMatrix();
}
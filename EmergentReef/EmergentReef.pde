
PVector lightBox = new PVector(1000, 1000, 1000);
PVector oceanBlue = new  PVector(28, 107, 160);
PVector sandyBottom = new PVector(194, 178, 128);
PVector Ground = new PVector(1000, 2, 1000);

Camera cam = new Camera();

ReefGrowth[] reef = new ReefGrowth[10];

SchoolOfFish coolfish = new SchoolOfFish();

PShader texShader;

void setup()
{
  size(800, 500, P3D);
  for (int i = 0; i < reef.length; i++)
  {
    ReefGrowth newReef = new ReefGrowth(new PVector(0, 0, 0), 0, 0);
    newReef.initialCoral(random(-100, 900), random(-500, 500));
    newReef.growSomeStuff();
    reef[i] = newReef;
  }
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
  translate(0, 501, 0);
  fill(sandyBottom.x, sandyBottom.y, sandyBottom.z);
  box(Ground.x, Ground.y, Ground.z);
  popMatrix();
  
  for (int i = 0; i < reef.length; i++)
  {
    reef[i].growAll();
  }
}
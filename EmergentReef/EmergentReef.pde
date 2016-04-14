
PVector lightBox = new PVector(100, 100, 100);
PVector oceanBlue = new  PVector(28, 107, 160);
PVector sandyBottom = new PVector(194, 178, 128);
PVector Ground = new PVector(100, 2, 100);

Camera cam = new Camera();

ReefGrowth reef;

ReefGrowth[] Corals = new ReefGrowth[10];

SchoolOfFish coolfish=new SchoolOfFish();

void setup()
{
  size(800, 500, P3D);
  reef = new ReefGrowth(new PVector(0, 0));
  Corals[0] = reef;
  coolfish.addCoral(reef);
  coolfish.fishsetup();
  
  for(int i = 0; i < 10; i++)
  {
    if (i > 0)
    {
      ReefGrowth newGrowth = new ReefGrowth(new PVector(Corals[0].location.x + random(-20, 20), Corals[0].location.y + random(-20, 0), Corals[0].location.z + random(-20, 20)));
      Corals[i] = newGrowth;
      coolfish.addCoral(newGrowth);
    }
  }
}

void draw()
{
  background(oceanBlue.x, oceanBlue.y, oceanBlue.z);
  
  //World
  cam.update();
  pushMatrix();
  translate(-50, -50, 350);
  coolfish.fishdraw();
  translate(50, 50, 50);
  noFill();
  stroke(255);
  box(lightBox.x, lightBox.y, lightBox.z);
  translate(0, 49, 0);
  fill(sandyBottom.x, sandyBottom.y, sandyBottom.z);
  box(Ground.x, Ground.y, Ground.z);
  popMatrix();
  
  Corals[0].grow();
  Corals[0].drawCoral();
  
  for(int i = 0; i < Corals.length - 1; i++)
  {
    if (Corals[i].Radius > 15)
    {
      Corals[i + 1].grow();
      Corals[i + 1].drawCoral();
    }
  }
}
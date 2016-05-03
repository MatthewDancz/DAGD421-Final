
class SchoolOfFish
{
  float schoolSize;
  int fishToAdd = 0;
  PVector type = new PVector(random(0, 255), random(0, 255), random(0, 255));
  float fishSize;
  float foo;
  
  School schoolfish =new School();
  
  SchoolOfFish(float n)
  {
    fishSize = n;
    schoolSize = 300 / fishSize;
  }
  
  void fishsetup()
  {
    for (int i = 0; i < schoolSize; i++)
    {
      schoolfish.addFish(new Fish(new PVector(random(-500, 500), random(-400, 400), random(-500, 500)), type, fishSize, random(3, 4)));
      //schoolfish.addFish(new Fish(new PVector(0, 0, 0), type, fishSize));
    }
    for(int i = 0; i < fishToAdd; i++)
    {
      moreFish();
    }
  }
  
  void fishdraw()
  {
    schoolfish.swim();  
  }
  
  void moreFish()
  {
    schoolfish.addFish(new Fish(new PVector(0, 0, 400), type, fishSize, random(3, 4)));
  }
}
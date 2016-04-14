
class SchoolOfFish
{
  int schoolSize = 12;
  int fishToAdd = 4;
  
  School schoolfish =new School();
  void fishsetup()
  {
    
    for (int i = 0; i < schoolSize; i++)
    {
      schoolfish.addFish(new Fish(new PVector(width/2, height/2,400)));
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
    schoolfish.addFish(new Fish(new PVector(0,0,400)));
  }
  
  void addCoral(ReefGrowth c)
  {
    schoolfish.addCoral(c);
  }
}
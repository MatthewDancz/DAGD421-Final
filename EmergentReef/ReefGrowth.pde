public class ReefGrowth
{
  public float Radius = 2;
  float CoralGrowth = .025;
  PVector location;
  PImage img;
  float randX;
  float randY;
  
  ReefGrowth[] Corals = new ReefGrowth[10];
  
  ReefGrowth(PVector v, float x, float y)
  {
    location = v;
    randX = x;
    randY = y;
  }
  
  void grow()
  {
    if(Radius < 20)
    {
      Radius += CoralGrowth;
    }
  }
  
  public void render()
  {
    pushMatrix();
    stroke(0, 255, 0);
    noFill();
    translate(this.location.x + randX, this.location.y + 500, this.location.z + 400 + randY);
    sphere(this.Radius);
    popMatrix();
  }
  
  public void initialCoral(float x, float y)
  {
    ReefGrowth reef = new ReefGrowth(new PVector(0, 0, 0), random(-100, 900), random(-500, 500));
    Corals[0] = reef;
  }
  
  public void growSomeStuff()
  {
    for(int i = 0; i < 10; i++)
    {
      if (i > 0)
      {
        ReefGrowth newGrowth = new ReefGrowth(new PVector(Corals[0].location.x + random(-20, 20), Corals[0].location.y + random(-20, 0), Corals[0].location.z + random(-20, 20)), 0, 0);
        Corals[i] = newGrowth;
      }
    }
  }
  
  public void growAll()
  {
    Corals[0].grow();
    Corals[0].render();
  
    for(int i = 0; i < Corals.length - 1; i++)
    {
      if (Corals[i].Radius > 15)
      {
        if (Corals[i + 1] != null)
        {
          Corals[i + 1].grow();
          Corals[i + 1].render();
        }
      }
    }
  }
}
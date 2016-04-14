public class ReefGrowth
{
  public float Radius = 2;
  float CoralGrowth = .025;
  PVector location;
  
  ReefGrowth(PVector v)
  {
    location = v;
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
    translate(this.location.x, this.location.y + 48, this.location.z + 400);
    sphere(this.Radius);
    popMatrix();
  }
}
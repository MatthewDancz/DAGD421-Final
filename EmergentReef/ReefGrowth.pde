public class ReefGrowth extends Fish
{
  public float Radius = 2;
  float CoralGrowth = .025;
  PVector direction;
  
  public ReefGrowth(PVector v)
  {
    super(v);
    maxSpeed = 0;
    maxForce = 1;
  }
  
  void grow()
  {
    if(Radius < 20)
    {
      Radius += CoralGrowth;
    }
  }
  
  void drawCoral()
  {
    pushMatrix();
    noStroke();
    fill(0, 255, 0);
    translate(this.location.x + this.Radius, this.location.y + 49, this.location.z + 400);
    sphere(this.Radius);
    popMatrix();
  }
}
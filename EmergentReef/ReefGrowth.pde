class ReefGrowth
{
  public float spawnRadius = 2;
  public float two = 2;
  public float radius;
  float CoralGrowth = .025;
  public PVector position;
  
  ReefGrowth(PVector v)
  {
    position = v;
    radius = spawnRadius;
  }
  
  void grow()
  {
    if(radius < 20)
    {
      radius += CoralGrowth;
    }
  }
  
  void drawCoral()
  {
    pushMatrix();
    noStroke();
    fill(0, 255, 0);
    translate(this.position.x, this.position.y + 49, this.position.z + 400);
    sphere(this.radius);
    popMatrix();
  }
}
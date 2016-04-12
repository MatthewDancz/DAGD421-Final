class ReefGrowth
{
  float spawnRadius = 2;
  float two = 2;
  float radius;
  PVector position;
  
  ArrayList<ReefGrowth> Corals = new ArrayList<ReefGrowth>();
  
  ReefGrowth(PVector v, float r)
  {
    position = v;
    radius = r;
  }
  
  void grow()
  {
    if(radius < 20)
    {
      radius += 1;
    }
    if(radius >= 15)
    {
      spawn(position);
    }
  }
  
  void spawn(PVector v)
  {
    ReefGrowth x = new ReefGrowth(new PVector(v.x + random(-5, 5), v.y + random(-5, 5)), spawnRadius);
    Corals.add(x);
  }
  
  void drawCoral(float r)
  {
    pushMatrix();
    noStroke();
    fill(0, 255, 0);
    for(ReefGrowth x : Corals)
    {
      translate(position.x, position.y + 49, 400);
      sphere(x.radius);
    }
    popMatrix();
  }
}
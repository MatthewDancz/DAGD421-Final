class Rock
{
  PVector Position;
  PVector Color;
  float Size;
  
  Rock()
  {
    Position  = new PVector(random(-500, 500), 0, random(-500, 500));
    Color = new PVector(random(137, 214), random(113, 207), random(91, 189));
    Size = random(50, 75);
  }
  
  void drawRock()
  {
    noStroke();
    fill(Color.x, Color.y, Color.z);
    
    pushMatrix();
    translate(Position.x, Position.y, Position.z);
    sphere(Size);
    popMatrix();
  }
}
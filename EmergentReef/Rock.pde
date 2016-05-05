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
    fill(Color.x + sin(theta) * 20, Color.y + sin(theta) * 20, Color.z + sin(theta) * 20);
    
    pushMatrix();
    translate(Position.x, Position.y, Position.z);
    sphere(Size);
    popMatrix();
  }
}
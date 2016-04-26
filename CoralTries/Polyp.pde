class Polyp
{
  PVector Position;
  PVector Color;
  
  Polyp(PVector v, PVector c)
  {
    Position = v;
    Color = c;
  }
  
  void drawPolyp()
  {
    noStroke();
    fill(Color.x, Color.y, Color.z);
    pushMatrix();
    translate(Position.x, Position.y, Position.z);
    box(15);
    popMatrix();
  }
}
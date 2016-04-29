
class Polyp
{
  PVector Position;
  PVector Color;
  float Size;
  float rotateAngle = random(0, TWO_PI);
  
  Polyp(PVector v, PVector c, float n)
  {
    Position = v;
    Color = c;
    Size = n;
  }
  
  void drawPolyp()
  {
    noStroke();
    fill(Color.x, Color.y, Color.z);
    pushMatrix();
    translate(Position.x, Position.y, Position.z);
    box(Size + random(-1, 1));
    popMatrix();
  }
}
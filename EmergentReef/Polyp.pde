
class Polyp
{
  PVector Position;
  PVector Color;
  float Size;
  float rotateAngle = random(0, TWO_PI);
  float theta = 0;
  boolean toBig = false;
  
  Polyp(PVector v, PVector c, float n)
  {
    Position = v;
    Color = c;
    Size = n;
  }
  
  void drawPolyp()
  {
    noStroke();
    fill(Color.x + sin(theta) * 20, Color.y + sin(theta) * 20, Color.z + sin(theta) * 20);
    pushMatrix();
    translate(Position.x, Position.y, Position.z);
    box(Size + sin(theta));
    popMatrix();
    //println(theta);
    fluxSize();
    
  }
  
  void fluxSize()
  {
    if (toBig) {
      theta = theta - random(.05, .1);
      if (theta <= 0) { toBig = false; }
    }
    if (!toBig) {
      theta = theta + random(.05, .1);
      if (theta >= 360) { toBig = true; }
    }
  }
}
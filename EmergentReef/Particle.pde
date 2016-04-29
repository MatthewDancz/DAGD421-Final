class Particle
{
  boolean meltMe = false;
  
  PVector Position = new PVector(random(-500, 500), 0, random(-500, 500));
  float snowHeight;
  float snowWidth;
  float fallSpeed;
  int index;
  
  float foo = 500;
  
  Particle(float z, float w, float v, int i, int startHeight)
  {
    snowHeight = z;
    snowWidth = w;
    fallSpeed = v;
    index = i;
    Position.y = startHeight;
  }
  
  void Display()
  {
    borders(500);
    pushMatrix();
    translate(Position.x, Position.y, Position.z);
    rotate(random(TWO_PI));
    ellipse(0, 0, snowHeight, snowWidth);
    popMatrix();
  }
  
  void borders(float s)
  {
    if (Position.x < -s) { Position.x = s; }
    if (Position.y < -s) { Position.y = s; Position.x = random(-s, s); Position.z = random(-s, s); }
    if (Position.z < -s) { Position.z = s; }
    if (Position.x > s) { Position.x = -s; }
    if (Position.y > s) { Position.y = -s; }
    if (Position.z > s) { Position.z = -s; }
  }
  
  public void ToMelt(boolean t) { meltMe = t; }
  public int getIndex() { return index; }
  public float MeltingPoint() { return Position.y; }
  public boolean MeltMe() { return meltMe; }
}
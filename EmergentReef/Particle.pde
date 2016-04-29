class Particle
{
  boolean meltMe = false;
  
  
  PVector Position = new PVector(random(-500, 500), 0, random(-500, 500));
  float snowHeight;
  float snowWidth;
  float fallSpeed;
  int index;
  
  float foo = 500;
  
  Particle(float z, float w, float v, int i)
  {
    snowHeight = z;
    snowWidth = w;
    fallSpeed = v;
    index = i;
  }
  
  void Display()
  {
    noStroke();
    borders(1000);
    pushMatrix();
    translate(Position.x, Position.y, Position.z);
    ellipse(0, 0, snowHeight, snowWidth);
    popMatrix();
  }
  
  void borders(float s)
  {
    if (Position.x < -foo) { Position.x = foo; }
    if (Position.y < 0) { Position.y = s; }
    if (Position.z < -foo) { Position.z = s; }
    if (Position.x > foo) { Position.x = -foo; }
    if (Position.y > s) { Position.y = 0; }
    if (Position.z > foo) { Position.z = -foo; }
  }
  
  public void ToMelt(boolean t) { meltMe = t; }
  public int getIndex() { return index; }
  public float MeltingPoint() { return Position.y; }
  public boolean MeltMe() { return meltMe; }
}
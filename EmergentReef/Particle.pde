class Particle
{
  boolean meltMe = false;
  
  
  PVector Position = new PVector(random(-500, 500), 0, random(-500, 500));
  float snowHeight;
  float snowWidth;
  float fallSpeed;
  int index;
  
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
    pushMatrix();
    translate(Position.x, Position.y, Position.z);
    ellipse(0, 0, snowHeight, snowWidth);
    popMatrix();
  }
  
  public void ToMelt(boolean t) { meltMe = t; }
  public int getIndex() { return index; }
  public float MeltingPoint() { return Position.y; }
  public boolean MeltMe() { return meltMe; }
}
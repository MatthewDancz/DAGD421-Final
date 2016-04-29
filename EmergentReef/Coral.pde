
class Coral
{
  float CoralMembers;
  float CoralSize;
  PVector Position;
  PVector Color;
  ArrayList<Polyp> coral = new ArrayList<Polyp>();
  
  Coral(PVector v, PVector c, float n, float m)
  {
    Position = v;
    Color = c;
    CoralMembers = n;
    CoralSize = m;
  }
  
  void populateCoral()
  {
    for (int i = 0; i < CoralMembers; i++)
    {
      addPolyp();
    }
  }
  
  void addPolyp()
  {
    Polyp newPolyp = new Polyp(
      new PVector(
        Position.x + random(-CoralSize, CoralSize),
        Position.y + random(-CoralSize, 0),
        Position.z + random(-CoralSize, CoralSize)),
      new PVector(
        Color.x + random(-10, 10),
        Color.y + random(-10, 10),
        Color.z + random(-10, 10)),
      random(10, 20));
    coral.add(newPolyp);
  }
  
  void drawCoral()
  {
    for (Polyp p : coral)
    {/*
      beginShape(TRIANGLES);
      vertex(p.Position.x, p.Position.y, p.Position.z);
      vertex(
      endShape();*/
      stroke(Color.x, Color.y, Color.z);
      line(p.Position.x, p.Position.y, p.Position.z, Position.x, Position.y, Position.z);
      p.drawPolyp();
    }
    
    pushMatrix();
    translate(Position.x, Position.y, Position.z);
    box(15);
    popMatrix();
  }
}
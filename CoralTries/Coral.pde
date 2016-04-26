
class Coral
{
  PVector Position;
  PVector Color;
  ArrayList<Polyp> coral = new ArrayList<Polyp>();
  
  Coral(PVector v, PVector c)
  {
    Position = v;
    Color = c;
  }
  
  void populateCoral()
  {
    addPolyp();
    addPolyp();
    addPolyp();
    addPolyp();
  }
  
  void addPolyp()
  {
    Polyp newPolyp = new Polyp(
      new PVector(
        Position.x + random(-50, 50),
        Position.y + random(-50, 0),
        Position.z + random(-50, 50)),
      new PVector(Color.x, Color.y, Color.z));
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
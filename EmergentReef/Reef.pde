
class Reef
{
  PVector Position;
  float ReefSize;
  float ReefMembers;
  
  ArrayList<Coral> corals = new ArrayList<Coral>();
  
  Reef(PVector v, float size, float members)
  {
    Position = v;
    ReefSize = size;
    ReefMembers = members;
  }
  
  void populateReef()
  {
    for (int i = 0; i < ReefMembers; i++)
    {
      addCoral();
    }

    for (Coral c : corals)
    {
      c.populateCoral();
    }
  }
  
  void addCoral()
  {
    Coral newCoral = new Coral(
      new PVector(
        Position.x + random(-ReefSize, ReefSize),
        Position.y,
        Position.z + random(-ReefSize, ReefSize)),
      new PVector(random(0, 256), random(0, 256), random(0, 256)),
      random(3, 8),
      random(20, 50));
    corals.add(newCoral);
  }
  
  void drawReef()
  {
    for (Coral c : corals)
    {
      c.drawCoral();
    }
  }
}
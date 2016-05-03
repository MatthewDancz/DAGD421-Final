
public class Fish
{
  PVector vFish;
  float neighborCount = 0;
  PVector location;
  PVector acceleration;
  PVector Color;
  float r;
  float maxForce;
  float maxSpeed;
  float maxSpeedRandom;
  float sc;
  float foo = 500;
  float colorDifference = 30;
  boolean avoidWalls=true;

  Fish(PVector v, PVector n, float x, float rand)
  {
    acceleration = new PVector(0, 0);

    float angle = random(TWO_PI);
    vFish = new PVector(cos(angle), sin(angle), angle);
    
    Color = new PVector(n.x + random(-colorDifference, colorDifference), n.y + random(-colorDifference, colorDifference), n.z + random(-colorDifference, colorDifference));
    
    location = new PVector(v.x, v.y, v.z);
    r = 2;
    sc = x;
    
    maxSpeedRandom = rand;
    maxSpeed = (maxSpeedRandom * sc)/(1.5 * sc);
    maxForce = .3;
  }
  void swim(ArrayList<Fish> fishes)
  {
    acceleration.add(PVector.mult(avoid(new PVector(location.x, foo, location.z), true), 5));
    acceleration.add(PVector.mult(avoid(new PVector(location.x, -foo, location.z), true), 5));
    acceleration.add(PVector.mult(avoid(new PVector(foo, location.y, location.z), true), 5));
    acceleration.add(PVector.mult(avoid(new PVector(-foo, location.y, location.z), true), 5));
    acceleration.add(PVector.mult(avoid(new PVector(location.x, location.y, foo), true), 5));
    acceleration.add(PVector.mult(avoid(new PVector(location.x, location.y, -foo), true), 5));
    schoolfish(fishes);
    update();
    borders(foo);
    render();
  }
  
  void applyForce(PVector force)
  {
    acceleration.add(force);
  }
  
  void schoolfish(ArrayList<Fish> fishes)
  {
    PVector sep=seperate(fishes);
    PVector ali=align(fishes);
    PVector coh=cohesion(fishes);

    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);

    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
  }
  
  void update()
  {
    vFish.add(acceleration);
    vFish.limit(maxSpeed);
    location.add(vFish);
    acceleration.mult(0);
  }
  
  PVector seek(PVector target)
  {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxSpeed);
    PVector steer=PVector.sub(desired, vFish);
    steer.limit(maxForce);
    return steer;
  }
  
  PVector avoid(PVector target, boolean weight)
  {
    PVector steer = new PVector();
    steer.set(PVector.sub(location, target));
    if(weight)
    {
      steer.mult(1/sq(PVector.dist(location, target)));
      steer.limit(maxForce);
    }
    return steer;  
  }
  
  void borders(float s)
  {
    if (location.x < -s) { location.x = s; }
    if (location.y < -s) { location.y = s; }
    if (location.z < -s) { location.z = s; }
    if (location.x > s) { location.x = -s; }
    if (location.y > s) { location.y = -s; }
    if (location.z > s) { location.z = -s; }
  }
  
  public void render()
  {
    fill(this.Color.x, this.Color.y, this.Color.z);
    noStroke();
    pushMatrix();
    translate(location.x, location.y, location.z);
    rotateY(atan2(-vFish.z, vFish.x));
    rotateZ(asin(vFish.y/vFish.mag()));
    
    beginShape(TRIANGLES);
    
    vertex(3*sc,0,0);
    vertex(-3*sc,2*sc,0);
    vertex(-3*sc,-2*sc,0);
    
    vertex(3*sc,0,0);
    vertex(-3*sc,2*sc,0);
    vertex(-3*sc,0,2*sc);
    
    vertex(-3*sc,0,2*sc);
    vertex(-3*sc,2*sc,0);
    vertex(-3*sc,-2*sc,0);
    
    endShape();
    popMatrix();
  }
  
  PVector seperate (ArrayList<Fish> fishes)
  {
    float desiredseperation = 30;
    PVector steer = new PVector(0,0,0);
    int count = 0;
    for(Fish other:fishes)
    {
      float d = PVector.dist(location,other.location);
      if((d>0)&&(d<desiredseperation))
      {
        PVector diff = PVector.sub(location,other.location);
        diff.normalize();
        diff.div(d);
        steer.add(diff);
        count++;
      }
    }
    if(count>0)
    {
      steer.div((float)count);
    }
    if(steer.mag()>0)
    {
      steer.normalize();
      steer.mult(maxSpeed);
      steer.sub(vFish);
      steer.limit(maxForce);
    }
    return steer;
  }
  
  PVector align(ArrayList<Fish> fishes)
  {
    float neighbors = 50;
    PVector sum = new PVector(0,0);
    int count = 0;
    for(Fish other:fishes)
    {
      float d =PVector.dist(location,other.location);
      if((d>0) && (d<neighbors))
      {
        sum.add(other.vFish);
        count++;
      }
    }
    if(count > 0)
    {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxSpeed);
      PVector steer=PVector.sub(sum,vFish);
      steer.limit(maxForce);
      return steer;
    }
    else
    {
      return new PVector(0,0);
    }
  }
  
  PVector cohesion (ArrayList<Fish> fishes) {
    float neighbordist = 60;
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (Fish other : fishes) {
      float d = PVector.dist(location, other.location);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.location); // Add location
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  // Steer towards the location
    } 
    else {
      return new PVector(0, 0);
    }
  }
}
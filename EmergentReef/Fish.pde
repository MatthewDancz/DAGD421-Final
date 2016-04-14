
class Fish
{
  PVector vfish;
  float neighborcount=0;
  PVector location;
  PVector acceleration;
  float r;
  float maxforce;
  float maxspeed;



  Fish(float x, float y,float z)
  {
    acceleration=new PVector(0, 0);

    float angle=random(TWO_PI);
    vfish =new PVector(cos(angle), sin(angle), angle);

    location=new PVector(x, y, z);
    r = 2;
    maxspeed = 2;
    maxforce = .3;
  }
  void swim(ArrayList<Fish> fishes)
  {
    schoolfish(fishes);
    update();
    borders();
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
    vfish.add(acceleration);
    vfish.limit(maxspeed);
    location.add(vfish);
    acceleration.mult(0);
  }
  PVector seek(PVector target)
  {
    PVector desired = PVector.sub(target, location);
    desired.normalize();
    desired.mult(maxspeed);
    PVector steer=PVector.sub(desired, vfish);
    steer.limit(maxforce);
    return steer;
  }
  void borders()
  {
    if (location.x < -r) location.x = 100 + r;
    if (location.y < -r) location.y = 100 + r;
    if (location.z < -r) location.z = 400 + r;
    if (location.x > 100 + r) location.x = -r;
    if (location.y > 100 + r) location.y = -r;
    if (location.z > 100 + r) location.z = -r;
    
  }
  void render()
  {
    float theta=vfish.heading()+radians(90);
    fill(200, 100);
    stroke(255);
    pushMatrix();
    translate(location.x, location.y, location.z);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
  }
  PVector seperate (ArrayList<Fish> fishes)
  {
    float desiredseperation=25;
    PVector steer=new PVector(0,0,0);
    int count=0;
    for(Fish other:fishes)
    {
      float d =PVector.dist(location,other.location);
      if((d>0)&&(d<desiredseperation))
      {
        PVector diff=PVector.sub(location,other.location);
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
      steer.mult(maxspeed);
      steer.sub(vfish);
      steer.limit(maxforce);
    }
    return steer;
  }
  PVector align(ArrayList<Fish> fishes)
  {
    float neighbors=50;
    PVector sum=new PVector(0,0);
    int count=0;
    for(Fish other:fishes)
    {
      float d =PVector.dist(location,other.location);
      if((d>0)&&(d<neighbors))
      {
        sum.add(other.vfish);
        count++;
      }
    }
    if(count>0)
    {
      sum.div((float)count);
      sum.normalize();
      sum.mult(maxspeed);
      PVector steer=PVector.sub(sum,vfish);
      steer.limit(maxforce);
      return steer;
    }
    else
    {
      return new PVector(0,0);
    }
  }
  
  PVector cohesion (ArrayList<Fish> fishes) {
    float neighbordist = 50;
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
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer player;

PVector lightBox = new PVector(1000, 1000, 1000);
PVector oceanBlue = new  PVector(28, 107, 160);
PVector sandyBottom = new PVector(194, 178, 128);
PVector Ground = new PVector(1000, 2, 1000);

Camera cam = new Camera();

Reef r = new Reef(new PVector(0,0,0), 500, random(50, 75));

SchoolOfFish[] coolFishes = new SchoolOfFish[10];
SchoolOfFish coolfish;

Particle[] particles = new Particle[10000];
int count = 0;
float offSetZ;
float offSetX;
float theta;

PShader texShader;

void setup()
{
  size(800, 500, P3D);
  minim = new Minim(this);
  player = minim.loadFile("Music.wav", 2048);
  player.play();
  player.loop();
  r.populateReef();
  for (int i = 0; i < coolFishes.length; i++)
  {
    coolfish = new SchoolOfFish(random(1, 5));
    coolfish.fishsetup();
    coolFishes[i] = coolfish;
  }
}

void draw()
{
  
  background(oceanBlue.x, oceanBlue.y, oceanBlue.z);
  
  if (true)
  {
    particles[count] = new Particle(random(2, 5), random(2, 5), random(.5, 1), count);
    count++;
  }
  
  //World
  cam.update();
  pushMatrix();
  translate(-500, -500, 350);
  
  //For the fish.
  for (SchoolOfFish f : coolFishes)
  {
    f.fishdraw();
  }
 
 //For the particles.
  for(Particle n : particles)
  {
    if (n != null)
    {
      n.Position.y = n.Position.y + n.fallSpeed; 
      n.Position.x = n.Position.x + offSetX;
      n.Position.z = n.Position.z;
      fill(sandyBottom.x, sandyBottom.y, sandyBottom.z);
      n.Display();
      if (n.MeltingPoint() > 1000)
      {
        n.ToMelt(true);
      }
    }
  }
 
  translate(0, 500, 0);
  noFill();
  stroke(255);
  box(lightBox.x, lightBox.y, lightBox.z);
  translate(0, 495, 0);
  r.drawReef();
  translate(0, 7, 0);
  fill(sandyBottom.x, sandyBottom.y, sandyBottom.z);
  box(Ground.x, Ground.y, Ground.z);
  popMatrix();
  
  if (particles[0].MeltMe())
  {
    count--;
    for(int i = 0; i < count; i++)
    {
      if (particles[i] == null)
      {
        break;
      }      
      particles[i] = particles[i + 1];
    }
  }
  
  theta += .01;
  offSetX = sin(theta) * 5;
}
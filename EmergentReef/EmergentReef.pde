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
PImage img1;
PImage img2;
PImage img3;

Camera cam = new Camera();

Reef r = new Reef(new PVector(0,0,0), 500, random(50, 75));

SchoolOfFish[] coolFishes = new SchoolOfFish[10];
SchoolOfFish coolfish;

Particle[] particles = new Particle[10000];
int count = 0;

float offSetZ;
float offSetX;
float theta;

Particle[] bubbles = new Particle[60];
int bubbleCount = 0;
PShader texShader;

//gradient Shader
PShader gradientShader;
//End gradient Shader

//Noise variables
float z = 0;
int dataSize = 50;
float[][] data = new float[dataSize][dataSize];
//End Noise variables

void setup()
{
  size(800, 500, P3D);
  img1 = loadImage("Image1.jpg");
  img2 = loadImage("surfaceClouds.jpg");
  img3 = loadImage("Image1.png");
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
  
  //load gradientShader
  gradientShader = loadShader("water.glsl");
  //End load gradientShader
}

void draw()
{
  //background(img2);
  background(oceanBlue.x, oceanBlue.y, oceanBlue.z);
  
  //Cam BackgroundShader
  PVector look = cam.getForward();
  float dot = look.dot(new PVector(0, -1, 0));
  gradientShader.set("look", (dot + 1)/2);
  filter(gradientShader);
  //End Cam BackgroundShader
  
  //drawBackGround(500, img3);
  //drawSurface(-500, img2);
  
  drawGround(505, img1);
  //fluxLight();
  //drawNoise(cam.position);
  
  if (count < 2000)
  {
    particles[count] = new Particle(random(2, 5), random(2, 5), random(.5, 1), count, -1000);
    count++;
  }
  
  if (bubbleCount < 10)
  {
    float bubbleSize = random(5, 8);
    bubbles[bubbleCount] = new Particle(bubbleSize, bubbleSize, 10, bubbleCount, 900);
    bubbleCount++;
  }
  
  //World
  cam.update();
  pushMatrix();
  
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
      noStroke();
      fill(sandyBottom.x, sandyBottom.y, sandyBottom.z);
      n.Display();
      if (n.MeltingPoint() > 1000)
      {
        n.ToMelt(true);
      }
    }
  } //End particles
  
  //For the Bubbles
  for (Particle n : bubbles)
  {
    if (n != null)
    {
      n.Position.y = n.Position.y - n.fallSpeed; 
      n.Position.x = n.Position.x;
      n.Position.z = n.Position.z;
      stroke(255);
      noFill();
      n.Display();
      if (n.MeltingPoint() > 1000)
      {
        n.ToMelt(true);
      }
    }
  } //End bubbles
 
  //translate(0, 500, 0);
  noFill();
  stroke(255);
  //box(lightBox.x, lightBox.y, lightBox.z);
  translate(0, 495, 0);
  r.drawReef();
  //translate(0, 7, 0);
  //fill(sandyBottom.x, sandyBottom.y, sandyBottom.z);
  //box(Ground.x, Ground.y, Ground.z);
  
  popMatrix();
  
  theta += .01;
  offSetX = sin(theta) * 5;
}

void drawGround(float n, PImage img)
{
  //Front
  beginShape();
  noStroke();
  texture(img);
  vertex(-n, n, -n, 0, 0);
  vertex(-n, n, n, 0, 225);
  vertex(n, n, n, 300, 225);
  vertex(n, n, -n, 300, 0);
  endShape();
}

void drawNoise(PVector v)
{
  for (int x = 0; x < 100; x++)
  {
    for(int y = 0; y < 100; y++)
    {
      float d = noise(x/(v.y + 500), y/(v.y + 500), z);
      if (d < .4)
      {
        noFill();
      }
      else if (d < .5)
      {
        fill(255);
      }
      else if (d < .7)
      {
        noFill();
      }
      else
      {
        noFill();
      }
      noStroke();
      pushMatrix();
      //translate(-500, 504, -500);
      translate(v.x - 50, v.y + 70, v.z - 50);
      rotateX(PI/2);
      rect(x, y, 1, 1);
      popMatrix();
    }
  }
}

boolean zoom = false;

void fluxLight()
{
  if (z <= 0) { zoom = true; }
  if (z >= 100) { zoom = false; }
  if(zoom)
  {
    z = z + random(.05, .1);
  }
  if(!zoom)
  {
    z = z - random(.05, .1);
  }
}
/*
void drawSurface(float n, PImage img)
{
  //Front
  beginShape();
  noStroke();
  texture(img);
  vertex(-n, n, -n, 0, 0);
  vertex(-n, n, n, 0, 400);
  vertex(n, n, n, 400, 400);
  vertex(n, n, -n, 400, 0);
  endShape();
}

void drawBackGround(float n, PImage img)
{
  noStroke();
  //Front
  beginShape();
  texture(img);
  vertex(n, n, n, 800, 500);
  vertex(n, -n, n, 800, 0);
  vertex(-n, -n, n, 0, 0);
  vertex(-n, n, n, 0, 500);
  endShape();
  
  //Back
  beginShape();
  texture(img);
  vertex(n, n, -n, 800, 500);
  vertex(n, -n, -n, 800, 0);
  vertex(-n, -n, -n, 0, 0);
  vertex(-n, n, -n, 0, 500);
  endShape();
  
  //left
  beginShape();
  texture(img);
  vertex(-n, -n, n, 0, 0);
  vertex(-n, -n, -n, 800, 0);
  vertex(-n, n, -n, 800, 500);
  vertex(-n, n, n, 0, 500);
  endShape();
  
  //right
  beginShape();
  texture(img);
  vertex(n, n, -n, 800, 500);
  vertex(n, n, n, 0, 500);
  vertex(n, -n, n, 0, 0);
  vertex(n, -n, -n, 800, 0);
  endShape();
}
*/
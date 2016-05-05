
PImage img1;
PShape can;
float angle;
PShader colorShader;
float n = 25;

void setup() {
  size(500, 500, P3D);
  img1 = loadImage("noise.png");
  can = createCan(100, 200, 32, img1);
  textureWrap(REPEAT);
  colorShader = loadShader("simpleFrag.glsl");
}

void draw() {    
  background(125);
  shader(colorShader);
  translate(width/2, height/2);
  rotateY(map(mouseX, 0, width, -PI, PI));
  rotateX(map(-mouseY, 0, height, -PI, PI));
  
  colorShader.set("time", millis()/1000.0);
  
  drawBox(n);
  
  resetShader();
  
  //shape(can);  
}

void drawBox(float n)
{
  noStroke();
  
  //Front
  beginShape();
  texture(img1);
  vertex(n, n, n, 1, 1);
  vertex(n, -n, n, 1, 0);
  vertex(-n, -n, n, 0, 0);
  vertex(-n, n, n, 0, 1);
  endShape();
  
  //Back
  beginShape();
  texture(img1);
  vertex(n, n, -n, 1, 1);
  vertex(n, -n, -n, 1, 0);
  vertex(-n, -n, -n, 0, 0);
  vertex(-n, n, -n, 0, 1);
  endShape();
  
  //left
  beginShape();
  texture(img1);
  vertex(-n, n, n, 0, 0);
  vertex(-n, n, -n, 0, 1);
  vertex(-n, -n, -n, 1, 0);
  vertex(-n, -n, n, 1, 1);
  endShape();
  
  //right
  beginShape();
  texture(img1);
  vertex(n, n, n, 0, 0);
  vertex(n, n, -n, 0, 1);
  vertex(n, -n, -n, 1, 0);
  vertex(n, -n, n, 1, 1);
  endShape();
  
  //top
  beginShape();
  texture(img1);
  vertex(n, -n, n, 0, 0);
  vertex(n, -n, -n, 0, 1);
  vertex(-n, -n, -n, 1, 0);
  vertex(-n, -n, n, 1, 1);
  endShape();
  
  //bottom
  beginShape();
  texture(img1);
  vertex(n, n, n, 0, 0);
  vertex(n, n, -n, 0, 1);
  vertex(-n, n, -n, 1, 0);
  vertex(-n, n, n, 1, 1);
  endShape();
}

PShape createCan(float r, float h, int detail, PImage image) {
  textureMode(NORMAL);
  PShape sh = createShape();
  sh.beginShape(QUAD_STRIP);
  sh.noStroke();
  sh.texture(image);
  for (int i = 0; i <= detail; i++) {
    float angle = TWO_PI / detail;
    float x = sin(i * angle);
    float z = cos(i * angle);
    float u = float(i) / detail;
    sh.normal(x, 0, z);
    sh.vertex(x * r, -h/2, z * r, u, 0);
    sh.vertex(x * r, +h/2, z * r, u, 1);    
  }
  sh.endShape(); 
  return sh;
}
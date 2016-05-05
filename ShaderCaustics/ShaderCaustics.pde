
PImage img;
PShader shader;



void setup() {
  size(500, 500, P3D);
  img = loadImage("noise.png");
  textureWrap(REPEAT);
  shader = loadShader("simpleFrag.glsl");
}

void draw() {
  background(0);
  shader(shader);
  
  shader.set("time", millis()/1000.0);
  
  beginShape();
  texture(img);
  int s = 200;
  vertex(0, 0, 0, 0, s);
  vertex(s, 0, 0, s, s);
  vertex(s, s, 0, s, 0);
  vertex(0, s, 0, 0, 0);
  endShape();
  
  resetShader();
}
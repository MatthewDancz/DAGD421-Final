
Camera cam = new Camera();
PShader shader;

void setup(){
  size(800, 500, P3D);
  shader = loadShader("water.glsl");
}

void draw(){
  background(20, 100, 255);
  
  cam.update();
  
  PVector look = cam.getForward();
  float dot = look.dot(new PVector(0, -1, 0));
  // THE DOT PRODUCT IS:
  //   -1 when looking down
  //    0 when looking horizontally
  //    1 when looking up
  shader.set("look", (dot + 1)/2);
  filter(shader);
  
  pushMatrix();
  translate(400, 0, 0);
  rotateX(millis()/1000.0);
  box(50,50,50);
  popMatrix();
  box(50,50,50);
}
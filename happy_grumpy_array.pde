int r, g, b;
ArrayList<Face> faces;

void setup() {
  size(640, 360);
  smooth();
  r = 29;
  g = 182;
  b = 85;
  faces = new ArrayList<Face>();
}

void draw() {

  make_background();
  make_Faces();

  for (int i=0; i<faces.size (); i++) {
    Face face = faces.get(i);
    face.tick();
  }
}

void make_background() {
  float colorMultiplier = 1 - (mouseX / (float)width);
  background(r * colorMultiplier, g * colorMultiplier, b * colorMultiplier);
}

void make_Faces() {

  if (frameCount % 300 == 0) {
    Face face = new Face();
    face.start(random(width), 0);
    faces.add(face);
  }
}

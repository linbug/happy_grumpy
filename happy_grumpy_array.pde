Face [] faces; //Face is the object, faces is the array
int numFaces = 2;
int currentFace = 0;
int counter = 0;
int r, g, b;
boolean overFace = false;


void setup () {
  size (640, 360);
  smooth ();
  r = 29;
  g = 182;
  b = 85;
  faces = new Face[numFaces];  //create the array
  for (int i = 0; i< numFaces; i++) {
    faces [i] = new Face();    //create each object in the array
  }
}

void draw() {

  counter ++;
  println (currentFace);

  make_background();
  make_Faces();
  move_Faces();
  check_if_overFace();
}

void make_background() {
  float colorMultiplier = 1 - (mouseX / (float)width);
  background(r * colorMultiplier, g * colorMultiplier, b * colorMultiplier);
}

void make_Faces() { 
  if (counter>300) {
    counter= 0;
  }

  if (currentFace < numFaces-1) {
    if (counter == 300) {
      faces[currentFace].start(random(0, width), height*0.25);
      currentFace+=1;
    }
  }
}

void move_Faces() {
  for (int i = 0; i< numFaces; i++) {
    faces[i].move();
  }
}

void check_if_overFace() {
  
print (overFace);
  for (int i = currentFace; i< numFaces; i++) {
    if (mouseX > faces[i].x-((faces[i].faceSize)/2) && mouseX < faces[i].x + (faces[i].faceSize)/2 && mouseY > faces[i].y-(faces[i].faceSize)/2 && mouseY < faces[i].y + (faces[i].faceSize)/2) {
       overFace=true;
    } else {
      overFace=false;
    }
  }
}






/*void mousePressed(){
 faces[currentFace].start(random(0,width),height*0.25);
 currentFace++;
 if (currentFace>= numFaces){
 currentFace = 0;}
 }*/

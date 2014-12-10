Face [] faces; //Face is the object, faces is the array
int numFaces = 5;
int currentFace = 0;
int counter = 0;
int r, g, b;
boolean overFace = false;
boolean faceLocked;
float bdifx = 0.0;
float bdify = 0.0;
float bx;
float by;
Face hoverFace = null;



void setup () {
  size (640, 360);
  smooth ();
  r = 29;
  g = 182;
  b = 85;
  bx = width/2.0;
  by = height/2.0;
  faces = new Face[numFaces];  //create the array
  for (int i = 0; i< numFaces; i++) {
    faces [i] = new Face();    //create each object in the array
  }
}

void draw() {

  counter ++;
  make_background();
  make_Faces();
  move_Faces();
  overFace = check_if_overFace();

  //println (overFace);
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
  if (!faceLocked) {
    for (int i = 0; i< numFaces; i++) {
      faces[i].move();
    }
  } else {
    println ("is locked");
  }
  
}



boolean check_if_overFace() {
  boolean OF = false;
  for (int i = 0; i< faces.length; i+=1) {
    Face myFace = (Face)faces[i];
    if 
      (mouseX > myFace.x- (myFace.faceSize/2) 
      && mouseX < myFace.x + (myFace.faceSize/2) 
      && mouseY > myFace.y - (myFace.faceSize/2)
      && mouseY < myFace.y + (myFace.faceSize/2)) 
    {
      OF = true;
      hoverFace = (Face)faces[i];
    }
  }
  return OF;
}


void mousePressed() {

  if (overFace) { 

    faceLocked = true; 

    //fill(255, 255, 255);
  } else {

    faceLocked = false;
  }
  if (hoverFace != null) {
    bdifx = mouseX-hoverFace.x; 

  bdify = mouseY-hoverFace.y;
  }
  
}

void mouseDragged() {

  if (faceLocked) {
    print ("mousedragged");
      if (hoverFace != null) {
      hoverFace.x = mouseX-bdifx; 

      hoverFace.y = mouseY-bdify;
      }
    }
  }




void mouseReleased() {

  faceLocked = false;
}


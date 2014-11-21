class Face {
  float x=width/2, y=height*0.25;
  int faceSize = 100;
  boolean overFace = false, locked=false;

  void start(float xpos, float ypos) {
    x = xpos;
    y = ypos;
  }

  void move() {

    if (y>(0.6)*height) {
      x = x+random(-4, 4);
    }
    fill(255, 62, 210);
    ellipse (x, y++, faceSize, faceSize);
    eye (x+20, y-20);
    eye (x-20, y-20);
    mouth (x, y);
  }

  void tick() {
    println("HI");
    move();
    checkShouldDie();
    handleDrag();
  }

  void checkShouldDie() {

    if (y > height + faceSize) {
      //die
    }
  }

  void handleDrag() {

    if (!mousePressed) {
      return;
    }

    if (mouseX < x - faceSize/2 || mouseX > x + faceSize/2) {
      return;
    }

    if (mouseY < y - faceSize/2 || mouseY > y + faceSize/2) {
      return;
    }

    // now move
    x = mouseX;
    y = mouseY;
  }
}

void eye (float x, float y) {
  boolean smiling;
  if (mouseY > y) {
    smiling = true;
  } else {
    smiling = false;
  }
  if (smiling) {
    fill(255, 255, 255) ;
  } else {
    fill(255, 0, 0) ;
  }
  ellipse (x, y, 10, 10);

  fill (0, 0, 0);
  ellipse ((x-3) + (mouseX/90.0), (y-2) + (mouseY/85.0), 2, 2);
}

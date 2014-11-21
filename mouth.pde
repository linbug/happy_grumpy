void mouth (float x, float y) {
  noFill();
  float s;
  boolean underHalf;
  boolean smax;
  underHalf = (mouseY>y)? true:false;
  if (underHalf) {
    s = (mouseY - y);
  } else
  {
    s = (y - mouseY);
  }
  smax = (s>50)? true:false;
  if (smax) {
    s=50;
  };
  noFill();
  stroke(0);
  if (underHalf) {
    arc(x, y+10, 45, s/2, 0, PI) ;
  } else
    arc(x, y+10, 45, s/2, PI, TWO_PI);
}

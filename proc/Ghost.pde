public class Ghost {
  public int x, y;
  public int shape; //0 = pacman, 1 = ghost
  public int c;

  public Ghost(int xx, int yy, int co) {
    x = xx;
    y = yy;
    c = co;
    shape = 0;
  }

  public void display(int i) {
    if ( i > 0) {
      display(true);
    } else {
      display(true, true);
    }
  }

  public void display(boolean a, boolean b) {
    if (shape == 0) {
      if (c == 0) {
        stroke(255, 0, 0);
        fill(255, 0, 0);
      }
      if (c == 1) {
        stroke(0, 255, 255);
        fill(0, 255, 255);
      }
      if(c == 2){
         stroke(255,192,203);
         fill(255,192,203);
      }
      ellipse(x * 50 - 25, y * 50 - 25, 40, 40);
    }
  }

  public void display(boolean i) {
    stroke(0, 0, 255);
    fill(0, 0, 255);
    ellipse(x * 50 - 25, y * 50 - 25, 40, 40);
  }
}
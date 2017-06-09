public class Ghost {
  public int x, y;
  public int shape; //0 = pacman, 1 = ghost

  public Ghost(int xx, int yy) {
    x = xx;
    y = yy;
    shape = 0;
  }

  public void display() {
    if (shape == 0) {
      stroke(204, 102, 100);
      ellipse(x * 50 - 25, y * 50 - 25, 40, 40);
    }
  }
}
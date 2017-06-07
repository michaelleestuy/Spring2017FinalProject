public class Pacman {
  public int x, y;
  public int shape; //0 = pacman, 1 = ghost

  public Pacman() {
    x = 2;
    y = 2;
    shape = 0;
  }

  public void display() {
    if (shape == 0) {
      stroke(204, 102, 0);
      ellipse(x * 50 - 25, y * 50 - 25, 48, 48);
    }
  }
}
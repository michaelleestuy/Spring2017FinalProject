public class Pacman {
  public int x, y;

  public Pacman() {
    x = 2;
    y = 2;
  }

  public void display() {

    stroke(255, 238, 0);
    fill(255, 238, 0);
    ellipse(x * 50 - 25, y * 50 - 25, 48, 48);
  }
}
public float x, y;
public int shape; //0 = pacman, 1 = ghost

public void display() {
  if (shape == 0) {
    ellipse(x * 50 - 25, y * 50 - 25, 48, 48);
  }
}
public abstract class StageStuff {
  public int x, y;

  private int type;


  public StageStuff() {
  }

  public StageStuff(int xa, int ya) {
    x = xa;
    y = ya;
  }

  public void settype(int i) {
    type = i;
  }

  public int gettype() {
    return type;
  }
}
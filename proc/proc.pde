import java.io.*;
import java.util.*;


StageStuff[][]stage = new StageStuff[15][15];
Pacman lom ;
int dir;

public void setup() {
  frameRate(2);
  dir = 3;

  lom = new Pacman();


  size(750, 750);
  String line = "";
  BufferedReader reader = createReader("mae.txt");
  for (int i  = 0; i < 15; i++) {
    try {
      line = reader.readLine();
    }
    catch(IOException e) {
      line = null;
    }
    if (line == null) {
      noLoop();
    } else {
      String[]pieces = split(line, " ");
      for (int j = 0; j < 15; j++) {
        if (pieces[j].equals("#")) {
          stage[j][i] = new Wall();
        } else {
          stage[j][i] = new Food();
        }
      }
    }
  }
}

public void update() {
  stroke(153);
  for (int i = 0; i < 15; i++) {
    for (int j = 0; j < 15; j++) {
      if (stage[i][j].gettype() == 0) {
        rect(50 * i, 50 * j, 50, 50);
      } else if (stage[i][j].gettype() == 1) {
        ellipse(50 * i + 25, 50 * j + 25, 10, 10);
      }
    }
  }
}

public void draw() {
  background(0);

  if (stage[lom.x - 1][lom.y - 1].gettype() == 1) {
    stage[lom.x - 1][lom.y - 1] = new Blank();
  }


  update();
  lom.display();
    if (canMove())
    movepac();
}

public void movepac() {
  if (dir == 0) {
    lom.y -= 1;
  }
  else if (dir == 1) {
    lom.x += 1;
  }
  else if (dir == 2) {
    lom.y += 1;
  } else {
    lom.x -= 1;
  }
}

public boolean canMove() {
  if (dir == 0 && lom.y - 1 > 0 && stage[lom.x - 1][lom.y - 2].gettype() != 0)
    return true;
  else if (dir == 1 && lom.x + 1 < 16 && stage[lom.x][lom.y - 1].gettype() != 0)
    return true;
  else if (dir == 2 && lom.y + 1 < 16 && stage[lom.x - 1][lom.y].gettype() != 0)
    return true;
  else if (dir == 3 && lom.x - 1 > 0 && stage[lom.x - 2][lom.y - 1].gettype() != 0)
    return true;
  else {
    return false;
  }
}

public void setdir(int d) {
  if (d == 0) {
    if (stage[lom.x][lom.y - 1].gettype() != 0)
      dir = 0;
  }
  if (d == 1) {
    if (stage[lom.x + 1][lom.y].gettype() != 0)
      dir = 1;
  }
  if (d == 2) {
    if (stage[lom.x][lom.y + 1].gettype() != 0)
      dir = 2;
  } else {
    if (stage[lom.x - 1][lom.y].gettype() != 0)
      dir = 3;
  }
}
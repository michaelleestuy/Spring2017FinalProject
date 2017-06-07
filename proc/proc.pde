import java.io.*;
import java.util.*;


StageStuff[][]stage = new StageStuff[19][21];
Pacman lom ;
int dir;
int counter;
public void setup() {
  frameRate(60);
  dir = 3;
  counter = 0;
  lom = new Pacman();


  size(1050, 1050);
  String line = "";
  BufferedReader reader = createReader("mae.txt");
  for (int i  = 0; i < 21; i++) {
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
      for (int j = 0; j < 19; j++) {
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
  for (int i = 0; i < 19; i++) {
    for (int j = 0; j < 21; j++) {
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
  updateDir();
  if (canMove() && counter >= 10) {
    movepac();
    counter = 0;
  }
  counter++; 
  update();
  lom.display();
}

public void updateDir() {
  if (key == 'W' || key == 'w')
    dir = 0;
  else if (key == 'D' || key == 'd')
    dir = 1;
  else if (key == 'S' || key == 's')
    dir = 2;
  else if (key == 'A' || key == 'a')
    dir = 3;
}

public void movepac() {
  if (dir == 0) {
    lom.y -= 1;
  } else if (dir == 1) {
    lom.x += 1;
  } else if (dir == 2) {
    lom.y += 1;
  } else {
    lom.x -= 1;
  }
}

public boolean canMove() {
  if (dir == 0 && lom.y - 1 > 0 && stage[lom.x - 1][lom.y - 2].gettype() != 0)
    return true;
  else if (dir == 1 && lom.x + 1 < 22 && stage[lom.x][lom.y - 1].gettype() != 0)
    return true;
  else if (dir == 2 && lom.y + 1 < 22 && stage[lom.x - 1][lom.y].gettype() != 0)
    return true;
  else if (dir == 3 && lom.x - 1 > 0 && stage[lom.x - 2][lom.y - 1].gettype() != 0)
    return true;
  else {
    return false;
  }
}
import java.io.*;
import java.util.*;


StageStuff[][]stage = new StageStuff[19][21];
Pacman lom ;
int dir;
int counter;
int score;
int time;
Ghost ghost1;
Ghost ghost2;
int tcounter;
int gcounter;
public void setup() {
  frameRate(60);
  dir = 3;
  time = 0;
  gcounter = 0;
  tcounter = 0;
  score = 0;
  counter = 0;
  lom = new Pacman();
  ghost1 = new Ghost(5, 5);
  ghost2 = new Ghost(5, 6);
  size(1250, 1050);
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

  if (tcounter >= 60) {
    time += 1;
    tcounter = 0;
  } else {
    tcounter++;
  }
  textSize(35);
  text("Score: " + score, 950, 50);
  text("Time: " + time, 950, 100);
}



public boolean checkDeath() {
  return (lom.x == ghost1.x && lom.y == ghost1.y) ||
    (lom.x == ghost2.x && lom.y == ghost2.y);
}

public void ghostTrack() { //ghost2
  ArrayList<Integer> dirs = new ArrayList<Integer>();
  if (ghost2.y - 1 > 0 && stage[ghost2.x - 1][ghost2.y - 2].gettype() != 0)
    dirs.add(0);
  if (ghost2.x + 1 < 22 && stage[ghost2.x][ghost2.y - 1].gettype() != 0)
    dirs.add(1);
  if (ghost2.y + 1 < 22 && stage[ghost2.x - 1][ghost2.y].gettype() != 0) 
    dirs.add(2);
  if (ghost2.x - 1 > 0 && stage[ghost2.x - 2][ghost2.y - 1].gettype() != 0)
    dirs.add(3);

  if (ghost2.y > lom.y && dirs.indexOf(0) != -1) 
    ghost2.y--;
  else if (ghost2.y < lom.y && dirs.indexOf(2) != -1)
    ghost2.y++;
  else if (ghost2.x > lom.x && dirs.indexOf(3) != -1)
    ghost2.x--;
  else if (ghost2.x < lom.x && dirs.indexOf(1) != -1)
    ghost2.x++;
  else {
    int i = dirs.get((new Random()).nextInt(dirs.size()));
    if (i == 0)
      ghost2.y -= 1;
    else if (i == 1)
      ghost2.x += 1;
    else if (i == 2)
      ghost2.y += 1;
    else if (i == 3)
      ghost2.x -= 1;
  }
}



public void ghostRandom() {
  // ghost1;
  ArrayList<Integer> dirs = new ArrayList<Integer>();
  if (ghost1.y - 1 > 0 && stage[ghost1.x - 1][ghost1.y - 2].gettype() != 0)
    dirs.add(0);
  if (ghost1.x + 1 < 22 && stage[ghost1.x][ghost1.y - 1].gettype() != 0)
    dirs.add(1);
  if (ghost1.y + 1 < 22 && stage[ghost1.x - 1][ghost1.y].gettype() != 0) 
    dirs.add(2);
  if (ghost1.x - 1 > 0 && stage[ghost1.x - 2][ghost1.y - 1].gettype() != 0)
    dirs.add(3);

  if (dirs.size() == 0)
    return;
  else {
    int i = dirs.get((new Random()).nextInt(dirs.size()));
    if (i == 0)
      ghost1.y -= 1;
    else if (i == 1)
      ghost1.x += 1;
    else if (i == 2)
      ghost1.y += 1;
    else if (i == 3)
      ghost1.x -= 1;
  }
}

public void draw() {
  background(0);

  if (stage[lom.x - 1][lom.y - 1].gettype() == 1) {
    stage[lom.x - 1][lom.y - 1] = new Blank();
    score += 100;
  }


  if (keyPressed)
    updateDir();

  if (counter >= 10) {
    if (canMove())
      movepac();
    if ( checkDeath()) {
      noLoop();
      update();
      lom.display();
      ghost1.display();
      ghost2.display();
      textSize(200);
      fill(0, 102, 153);
      text("You lost", 100, 400);
      return;
    }

    if (gcounter >= 1) {
      ghostRandom();
      ghostTrack();
      gcounter = 0;
    } else {
      gcounter++;
    }

    if (checkDeath()) {
      noLoop();
      update();
      lom.display();
      ghost1.display();
      ghost2.display();
      textSize(200);
      fill(0, 102, 153);
      text("You lost", 100, 400);
      return;
    }
    counter = 0;
  }

  if (score >= 18800) {
    noLoop(); 
    update();
    lom.display();
    ghost1.display();
    ghost2.display();
    textSize(200);
    fill(0, 102, 153);
    text("You won", 100, 400);
    return;
  }

  counter++; 
  update();
  lom.display();
  ghost1.display();
  ghost2.display();
}

public void updateDir() {
  if (key == 'W' || key == 'w')
    setdir(0);
  else if (key == 'D' || key == 'd')
    setdir(1);
  else if (key == 'S' || key == 's')
    setdir(2);
  else if (key == 'A' || key == 'a')
    setdir(3);
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


public void setdir(int d) {
  if (d == 0) {
    if (stage[lom.x - 1][lom.y - 2].gettype() != 0)
      dir = 0;
  } else if (d == 1) {
    if (stage[lom.x][lom.y - 1].gettype() != 0)
      dir = 1;
  } else if (d == 2) {
    if (stage[lom.x - 1][lom.y].gettype() != 0)
      dir = 2;
  } else {
    if (stage[lom.x - 2][lom.y - 1].gettype() != 0)
      dir = 3;
  }
} 
import java.util.ArrayList;
import processing.sound.*;
SoundFile bruh;
Board theBoard;
Sticky figure;
BoardItem x1;
BoardItem x2;
BoardItem x3;
BoardItem x4;
BoardItem x5;
BoardItem o1;
BoardItem o2;
BoardItem o3;
BoardItem o4;
BoardItem o5;
PFont f;
PFont c;
Confetti[] confet;


public int[][] layer = {

  {255, 255, 255}, 
  {255, 255, 255}, 
  {255, 255, 255}, 

};





void setup() {
  size(750, 750);
  f = createFont("Comic Sans MS", 200, true);
  c = createFont("Comic Sans MS", 75, true);
  theBoard = new Board(3, 3, 3, 3, 246);
  bruh = new SoundFile(this, "BruhSound.mp3");

  confet = new Confetti[1000];
  for (int i = 0; i < confet.length; i++) {
    float x = (float)((750) * Math.random() );
    float y = (float)((height - 5000) * Math.random());
    float s = 2;
    float a = (float)(.5 * Math.random());
    float c = (float)((255) * Math.random());

    confet[i] = new Confetti(x, y, s, a, c);
  }

  //X pieces
  x1 = new BoardItem(-10, -10);
  int[][] x1Data = {{ 0 }};
  x1.setData(x1Data);
  theBoard.addItem(x1);
  x2 = new BoardItem(-10, -10);
  int[][] x2Data = {{ 0 }};
  x2.setData(x2Data);
  theBoard.addItem(x2);
  x3 = new BoardItem(-10, -10);
  int[][] x3Data = {{ 0 }};
  x3.setData(x3Data);
  theBoard.addItem(x3);
  x4 = new BoardItem(-10, -10);
  int[][] x4Data = {{ 0 }};
  x4.setData(x4Data);
  theBoard.addItem(x4);
  x5 = new BoardItem(-10, -10);
  int[][] x5Data = {{ 0 }};
  x5.setData(x5Data);
  theBoard.addItem(x5);

  //O pieces
  o1 = new BoardItem(-10, -10);
  int[][] o1Data = {{ -1 }};
  o1.setData(o1Data);
  theBoard.addItem(o1);
  o2 = new BoardItem(-10, -10);
  int[][] o2Data = {{ -1 }};
  o2.setData(o2Data);
  theBoard.addItem(o2);
  o3 = new BoardItem(-10, -10);
  int[][] o3Data = {{ -1 }};
  o3.setData(o3Data);
  theBoard.addItem(o3);
  o4 = new BoardItem(-10, -10);
  int[][] o4Data = {{ -1 }};
  o4.setData(o4Data);
  theBoard.addItem(o4);
  o5 = new BoardItem(-10, -10);
  int[][] o5Data = {{ -1 }};
  o5.setData(o5Data);
  theBoard.addItem(o5);

  theBoard.addLayer( layer );

  //figure = new Sticky(0, 0);
  //theBoard.addItem(figure);
}

void draw() {
  //size(750, 750);

  background(255);
  theBoard.show();
  if (theBoard.winX == 1) {
    textFont(f);
    fill(255, 0, 0);
    bruh.loop(50);
    text("X Wins", (width/2)-325, (height/2)+50);
    textFont(c);
    text("Press 'R' to Reset", 110, 730);
    for (int i = 0; i <1000; i++) {

      confet[i].show();
      confet[i].move();
    }
  }
  if (theBoard.winO == 1) {
    textFont(f);
    fill(0, 0, 255);
    bruh.loop(50);
    text("O Wins", (width/2)-335, (height/2)+50);
    textFont(c);
    text("Press 'R' to Reset", 110, 730);
    for (int i = 0; i <1000; i++) {

      confet[i].show();
      confet[i].move();
    }
  }
  if (theBoard.turn == 9 && theBoard.winO == 0 && theBoard.winX == 0) {
    textFont(f);
    fill(#FB1CFF);
    bruh.loop(50);


    text("Cat's", (width/2)-270, (height/2));
    text("Game!", (width/2)-260, (height/2)+160);
    textFont(c);
    text("Press 'R' to Reset", 110, 730);
  }
}



void mouseClicked() {

  bruh.play();
  int xClicked = mouseX - theBoard.x_pos;
  int yClicked = mouseY - theBoard.y_pos;

  int xAt = xClicked/theBoard.cellSize;
  int yAt = yClicked/theBoard.cellSize;
  if (theBoard.winX == 0 && theBoard.winO == 0) {
    if (layer[yAt][xAt] == 255) {
      theBoard.moveItem(mouseX, mouseY, theBoard.turn);
      theBoard.turn++;
    }
  }

  if (layer[0][0] == 254 && layer[0][1] == 254 && layer[0][2] == 254) {
    theBoard.winO = 1;
  }
  if (layer[1][0] == 254 && layer[1][1] == 254 && layer[1][2] == 254) {
    theBoard.winO = 1;
  }
  if (layer[2][0] == 254 && layer[2][1] == 254 && layer[2][2] == 254) {
    theBoard.winO = 1;
  }
  if (layer[0][0] == 254 && layer[1][0] == 254 && layer[2][0] == 254) {
    theBoard.winO = 1;
  }
  if (layer[0][1] == 254 && layer[1][1] == 254 && layer[2][1] == 254) {
    theBoard.winO = 1;
  }
  if (layer[0][2] == 254 && layer[1][2] == 254 && layer[2][2] == 254) {
    theBoard.winO = 1;
  }
  if (layer[0][0] == 254 && layer[1][1] == 254 && layer[2][2] == 254) {
    theBoard.winO = 1;
  }
  if (layer[2][0] == 254 && layer[1][1] == 254 && layer[0][2] == 254) {
    theBoard.winO = 1;
  }
  if (layer[0][0] == 253 && layer[0][1] == 253 && layer[0][2] == 253) {
    theBoard.winX = 1;
  }
  if (layer[1][0] == 253 && layer[1][1] == 253 && layer[1][2] == 253) {
    theBoard.winX = 1;
  }
  if (layer[2][0] == 253 && layer[2][1] == 253 && layer[2][2] == 253) {
    theBoard.winX = 1;
  }
  if (layer[0][0] == 253 && layer[1][0] == 253 && layer[2][0] == 253) {
    theBoard.winX = 1;
  }
  if (layer[0][1] == 253 && layer[1][1] == 253 && layer[2][1] == 253) {
    theBoard.winX = 1;
  }
  if (layer[0][2] == 253 && layer[1][2] == 253 && layer[2][2] == 253) {
    theBoard.winX = 1;
  }
  if (layer[0][0] == 253 && layer[1][1] == 253 && layer[2][2] == 253) {
    theBoard.winX = 1;
  }
  if (layer[2][0] == 253 && layer[1][1] == 253 && layer[0][2] == 253) {
    theBoard.winX = 1;
  }
}

void keyPressed() {
  if (key == 'r' || key == 'R') {
    bruh.loop(1);
    bruh.stop();
    strokeWeight(10);

    theBoard.winX = 0;
    theBoard.winO = 0;
    for (int i = 0; i < theBoard.items.size(); i++) {
      theBoard.items.get(i).rowId = -10;
      theBoard.items.get(i).colId = -10;
    }

    layer[0][0] = 255;
    layer[0][1] = 255;
    layer[0][2] = 255;
    layer[1][0] = 255;
    layer[1][1] = 255;
    layer[1][2] = 255;
    layer[2][0] = 255;
    layer[2][1] = 255;
    layer[2][2] = 255;


    theBoard.turn = 0;
    theBoard.show();
  }
}

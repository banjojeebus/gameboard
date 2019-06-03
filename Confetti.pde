class Confetti {
  float x_pos;
  float y_pos;
  float speed;
  float angle;
  float normColor;
  public Confetti(float x, float y, float s, float a, float c) {
    x_pos = x;
    y_pos = y;
    speed = s;
    angle = a;
    normColor = c;
  }

  void move() {


    x_pos = x_pos + angle;
    y_pos = y_pos + speed;
  }

  void show() {
    pushMatrix();
    translate(x_pos, y_pos);
    strokeWeight(1);
    fill((int)(255*Math.random()+50),(int)(255*Math.random()+50),(int)(255*Math.random()+50));
    ellipse(0, 0, 10, 10);
    strokeWeight(10);
    popMatrix();
  }
}

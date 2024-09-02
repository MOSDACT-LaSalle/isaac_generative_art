// Definición de la clase Particle3 
class Particle3 {
  PVector pos, vel, acc;
  float maxspeed = 2;
  color c;  // Variable de color para la partícula

  Particle3() {
    pos = new PVector(random(width), random(height));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);

    float yPosition = pos.y;
    float fraction = yPosition / height;
    float xPosition = pos.x;
    float fractionx = xPosition / width;
    c = lerpColor(color(229, 225, 232), color(202, 162, 232), fraction);
  }

  void follow(PVector[] vectors) {
    int x = int(pos.x / scale);
    int y = int(pos.y / scale);
    x = constrain(x, 0, cols - 1);
    y = constrain(y, 0, rows - 1);
    int index = x + y * cols;
    PVector force = vectors[index];
    applyForce(force);
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void update() {
    vel.add(acc);
    vel.limit(maxspeed);
    pos.add(vel);
    acc.mult(0);
  }

  void show() {
    stroke(c);
    strokeWeight(2);
    point(pos.x, pos.y);
  }

  void edges() {
    if (pos.x > width) pos.x = 0;
    if (pos.x < 0) pos.x = width;
    if (pos.y > height) pos.y = 0;
    if (pos.y < 0) pos.y = height;
  }
}

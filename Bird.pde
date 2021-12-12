
class Bird {

  // Main data points.
  float x = 1.f, y = 1.f, r = 0.f;
  float xVel = 3.f, yVel = 5.f, yAccel = -6.f; // Units per second.
  
  void updatePosition(float timeDelta) {
    x += (timeDelta / 1000.f) * xVel;
    y += (timeDelta / 1000.f) * yVel;
    yVel += (timeDelta / 1000.f) * yAccel;
  }
}


class Bird {

  // Main data points.
  float x = 1.f, y = 1.f, r = 0.4f;
  float xVel = 0.f, yVel = 0.f, yAccel = -0.f; // Units per second.
  
  void updatePosition(float timeDelta) {
    x += (timeDelta / 1000.f) * xVel;
    y += (timeDelta / 1000.f) * yVel;
    yVel += (timeDelta / 1000.f) * yAccel;
  }
}

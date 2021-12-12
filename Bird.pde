
class Bird {

  // Main data points.
  float x = 0.f, y = 0.f, r = 0.f;
  float xVel = 0.f, yVel = 0.f; // Units per second.
  
  void updatePosition(float timeDelta) {
    x += (timeDelta / 1000.f) * xVel;
    y += (timeDelta / 1000.f) * yVel;
  }
}

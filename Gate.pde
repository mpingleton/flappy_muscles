
class Gate {

  float positionX = 0.f, w = 0.8f;
  float openingTop = 0.f, openingBottom = 0.f;
  
  Gate() {}
  
  Gate(float atX, float withTop, float withBottom) {
    positionX = atX;
    openingTop = withTop;
    openingBottom = withBottom;
  }
  
  boolean collision(Bird bird) {
    if (bird.x + bird.r >= positionX - (w / 2.f) && bird.x - bird.r <= positionX + (w / 2.f)) {
      if (bird.y + (bird.r * 0.8f) >= openingTop || bird.y - (bird.r * 0.8f) <= openingBottom) {
        return true;
      }
    }
    
    return false;
  }
}

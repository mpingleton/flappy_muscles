
class Gate {

  float positionX = 0.f, w = 1.f;
  float openingTop = 0.f, openingBottom = 0.f;
  
  Gate() {}
  
  Gate(float atX, float withTop, float withBottom) {
    positionX = atX;
    openingTop = withTop;
    openingBottom = withBottom;
  }
}

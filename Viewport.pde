
class Viewport {

  float left = 0.f, right = 10.f, top = 5.f, bottom = -5.f;
  
  float getPixelPositionX(float viewportX) {
    return ((viewportX - left) / (right - left)) * width;
  }
  
  float getPixelPositionY(float viewportY) {
    return (((viewportY - bottom) / (top - bottom)) * height);
  }
}
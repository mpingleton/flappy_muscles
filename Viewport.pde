
class Viewport {

  float left = 0.f, right = 0.f, top = 0.f, bottom = -0.f;
  
  float getPixelPositionX(float viewportX) {
    return ((viewportX - left) / (right - left)) * (float)width;
  }
  
  float getPixelPositionY(float viewportY) {
    return (float)height - (((viewportY - bottom) / (top - bottom)) * (float)height);
  }
 
  float unitWidth() {
    return (float)width / (right - left);
  }
  
  float unitHeight() {
    return (float)height / (top - bottom);
  }
}

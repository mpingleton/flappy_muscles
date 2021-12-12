
class Viewport {

  float left = 0.f, right = 10.f, top = 5.f, bottom = -5.f;
  
  float getPixelPositionX(float viewportX) {
    return ((viewportX - left) / (right - left)) * width;
  }
  
  float getPixelPositionY(float viewportY) {
    return height - (((viewportY - bottom) / (top - bottom)) * height);
  }
 
  float unitWidth() {
    return width / (right - left);
  }
  
  float unitHeight() {
    return height / (top - bottom);
  }
}

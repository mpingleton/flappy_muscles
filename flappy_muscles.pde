
Viewport vp = new Viewport();
Bird bird = new Bird();
Gate[] gates = new Gate[100];

PImage birdImage;

void setup() {
  // Set up the graphics window.
  fullScreen();
  
  // Initialize the data members.
  vp.left = 0.f;
  vp.right = 16.f;
  vp.top = 5.f;
  vp.bottom = -5.f;
  
  for (int i = 0; i < gates.length; i++) {
    gates[i] = new Gate();
    gates[i].positionX = (i * 5.f) + 6.f;
    gates[i].openingTop = 2.f;
    gates[i].openingBottom = -2.f;
  }
  
  // Load the image assets.
  birdImage = loadImage("bird.png");
}

void draw() {
  // Clear the screen.
  background(0, 0, 0);
  
  // Draw the gates.
  fill(0, 255, 0);
  for (int i = 0; i < gates.length; i++) {
    pushMatrix();
    translate(vp.getPixelPositionX(gates[i].positionX), 0);
    
    rect(-25, 0, 50, vp.getPixelPositionY(gates[i].openingTop));
    rect(-25, vp.getPixelPositionY(gates[i].openingBottom), 50, height - vp.getPixelPositionY(gates[i].openingBottom));
    
    popMatrix();
  }
  
  // Draw the bird.
  image(birdImage, vp.getPixelPositionX(bird.x) - (vp.unitWidth() / 2.f), vp.getPixelPositionY(bird.y) - (vp.unitHeight() / 2.f), vp.unitWidth(), vp.unitHeight());
}

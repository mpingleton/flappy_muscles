
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
    gates[i].openingTop = abs(cos(i * 1.7)) * 2 + 1;
    gates[i].openingBottom = -abs(cos(i * 1.4)) * 2 - 1;
  }
  
  // Load the image assets.
  birdImage = loadImage("bird.png");
}

int lastFrame = 0;

void draw() {
  // Clear the screen.
  background(0, 0, 0);
  
  // Move the viewport if nessesary.
  if (bird.x >= 6.f) {
    vp.left = bird.x - 6.f;
    vp.right = bird.x + 10.f;
  }
  
  // Draw the gates.
  fill(0, 255, 0);
  for (int i = 0; i < gates.length; i++) {
    pushMatrix();
    translate(vp.getPixelPositionX(gates[i].positionX), 0);
    rect(-vp.unitWidth() / 2.f, 0, vp.unitWidth(), vp.getPixelPositionY(gates[i].openingTop));
    rect(-vp.unitWidth() / 2.f, vp.getPixelPositionY(gates[i].openingBottom), vp.unitWidth(), height - vp.getPixelPositionY(gates[i].openingBottom));
    popMatrix();
  }
  
  // Draw the bird.
  bird.updatePosition(millis() - lastFrame);
  image(birdImage, vp.getPixelPositionX(bird.x) - (vp.unitWidth() / 2.f), vp.getPixelPositionY(bird.y) - (vp.unitHeight() / 2.f), vp.unitWidth(), vp.unitHeight());
  
  // Update last frame time.
  lastFrame = millis();
}

void keyPressed() {
  bird.yVel = 5.f;
}

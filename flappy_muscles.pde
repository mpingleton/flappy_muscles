
Viewport vp = new Viewport();
Bird bird = new Bird();
Gate[] gates = new Gate[45];

PImage birdImage;
PImage backgroundImage;

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
    gates[i].positionX = (i * 5.f) + 18.f;
    gates[i].openingTop = abs(cos(i * 1.7)) * 2 + 1;
    gates[i].openingBottom = -abs(cos(i * 1.4)) * 2 - 1;
  }
  
  // Load the image assets.
  birdImage = loadImage("bird.png");
  backgroundImage = loadImage("flappy-background.png");
}

int lastFrame = 0;

void draw() {
  // Clear the screen and draw the background.
  background(0, 0, 0);
  image(backgroundImage, 0, 0, width, height);
  
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
    rect(-vp.unitWidth() * gates[i].w / 2.f, 0, vp.unitWidth() * gates[i].w, vp.getPixelPositionY(gates[i].openingTop));
    rect(-vp.unitWidth() * gates[i].w / 2.f, vp.getPixelPositionY(gates[i].openingBottom), vp.unitWidth() * gates[i].w, height - vp.getPixelPositionY(gates[i].openingBottom));
    popMatrix();
    if (gates[i].collision(bird)) {
      bird.xVel = 0.f;
      bird.yVel = 0.f;
      bird.yAccel = 0.f;
    }
  }
  
  // Draw the bird.
  bird.updatePosition(millis() - lastFrame);
  pushMatrix();
  translate(vp.getPixelPositionX(bird.x), vp.getPixelPositionY(bird.y));
  rotate(-bird.yVel / 20.f);
  image(birdImage, -vp.unitWidth() * bird.r, -vp.unitHeight() * bird.r, vp.unitWidth() * bird.r * 2.f, vp.unitHeight() * bird.r * 2.f);
  popMatrix();
  
  // Update last frame time.
  lastFrame = millis();
}

void keyPressed() {
  bird.yVel = 5.f;
}

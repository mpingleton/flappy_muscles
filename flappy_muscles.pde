Controller controller;

Viewport vp = new Viewport();
Bird bird = new Bird();
Gate[] gates = new Gate[45];
boolean gameStarted = false;
boolean gameOver = false;

PImage birdImage;
PImage backgroundImage;

void setup() {
  // Set up the graphics window.
  fullScreen();
  
  // Connect to the controller.
  controller = new Controller();
  controller.connect(this, "/dev/cu.usbserial-21140");
  
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

void serialEvent(Serial s) {
  controller.event(s);
}

int lastFrame = 0;

void draw() {
  if(!gameOver) {
    controller.check();
  }
  
  // Clear the screen and draw the background.
  background(0, 0, 0);
  //image(backgroundImage, 0, 0, width, height); // This call is too heavy and impacts the framerate.
  
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
    rect(-vp.unitWidth() * gates[i].w / 2.f, vp.getPixelPositionY(gates[i].openingBottom), vp.unitWidth() * gates[i].w, (float)height - vp.getPixelPositionY(gates[i].openingBottom));
    popMatrix();
    if (gates[i].collision(bird)) {
      bird.xVel = 0.f;
      bird.yVel = 0.f;
      bird.yAccel = 0.f;
      gameOver = true;
    }
  }
  
  // Draw the bird.
  bird.updatePosition((float)millis() - (float)lastFrame);
  pushMatrix();
  translate(vp.getPixelPositionX(bird.x), vp.getPixelPositionY(bird.y));
  rotate(-bird.yVel / 20.f);
  image(birdImage, -vp.unitWidth() * bird.r, -vp.unitHeight() * bird.r, vp.unitWidth() * bird.r * 2.f, vp.unitHeight() * bird.r * 2.f);
  popMatrix();
  
  // Draw the game over.
  if(gameOver) {
    fill(0, 255, 0);
    textSize(80);
    text("Game Over", width / 2, height / 2);
  }
  
  // Draw the intro.
  if(!gameStarted) {
    fill(0, 255, 0);
    textSize(50);
    text("Pull up on the machine to start.", width / 2, height / 2);
  }
  
  // Update last frame time.
  lastFrame = millis();
}

void sensorEvent() {
  if(controller.sensorValue - controller.sensorValuePrev < -20) {
    if(gameStarted) {
      bird.yVel = (float)(controller.sensorValuePrev - controller.sensorValue) / 60.f;
    }
    else if(controller.sensorValue - controller.sensorValuePrev < -100) {
      gameStarted = true;
      bird.yAccel = -6.0f;
      bird.xVel = 3.0f;
      bird.yVel = 0.0f;
    }
  }
}

/*
void keyPressed() {
  bird.yVel = 5.f;
}
*/

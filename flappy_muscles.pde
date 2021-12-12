
Viewport vp = new Viewport();
Bird bird = new Bird();
Gate[] gates = new Gate[100];

PImage birdImage;

void setup() {
  // Set up the graphics window.
  fullScreen();
  
  // Initialize the data members.
  vp.left = 0.f;
  vp.right = 10.f;
  vp.top = 6.f;
  vp.bottom = -6.f;
  
  for (int i = 0; i < gates.length; i++) {
    gates[i] = new Gate();
    gates[i].positionX = 0.f;
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
  for (int i = 0; i < gates.length; i++) {
   
  }
  
  // Draw the bird.
  image(birdImage, 300, 300, );
}

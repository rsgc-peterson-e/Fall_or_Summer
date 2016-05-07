// Create a global variable (actually an object) to hold the picture
PImage scene;

// Runs once
void setup() {

  // Create canvas
  size(800, 500);

  // Load the picture into the scene object 
  //scene = loadImage("fall_forest.jpg");
  scene = loadImage("summer_field.jpg");
  
  // Change colour mode to HSB
  colorMode(HSB, 360, 100, 100, 100);
  
  // No border on shapes drawn
  noStroke();
  
}

// Runs repeatedly
void draw() {

  // Display the contents of the scene object, top-left corner of image at (0, 0)
  image(scene, 0, 0);

  // Make the pixels of the image available for inspect
  loadPixels();

  // Translate current pixel mouse is hovering over into a position in the pixels[] array
  int currentRow = mouseY;
  int currentColumn = mouseX;
  int pixelPosition = currentRow * width + currentColumn;
  
  // Get the hue of the pixel the mouse is pointing at
  float currentHue = hue(pixels[pixelPosition]);
  
  // Report the results
  fill(0);
  text("Hue of current pixel is: " + currentHue, width - 250, 25);
  
}
// Create a global variable (actually an object) to hold the picture
PImage scene;

// Runs once
void setup() {

  // Create canvas
  size(800, 500);

  // Load the picture into the scene object 
  //scene = loadImage("fall_forest.jpg");
  //scene = loadImage("summer_field.jpg");
  scene = loadImage("summerTest.jpg");
  //scene = loadImage("fallTest.jpg");
  
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
  float currentSat = saturation(pixels[pixelPosition]);
  float currentBright = brightness(pixels[pixelPosition]);
  
  // detect the season
  String season;
  if (currentBright > 40 && currentHue > 80) {
    season = "Summer";
  } else {
    season = "fall";
  }
  
  // Report the results
  fill(0);
  text("Hue of current pixel is: " + currentHue, width - 250, 25);
  // add saturation and brightness
  text("Saturation of current pixel is: " + currentSat, width - 250, 50);
  text("Brightness of current pixel is: " + currentBright, width - 250, 75);
  text("Season: " + season, width - 250, 100);
}

void mouseClicked() {
  int row = mouseY;
  float totalBrightness = 0;
  float totalHue = 0;
  float totalSat = 0;
  for (int i = 0; i < pixels.length; i++) {
    //int position = row * width + i;
    totalBrightness += brightness(pixels[i]);
    totalHue += hue(pixels[i]);
    totalSat += saturation(pixels[i]);
  }
  float averageBright = (float) totalBrightness / width;
  float averageHue = (float) totalHue / width;
  float averageSat = (float) totalSat / width;
  //println("Total Brightness: " + totalBrightness);
  //println("Average Brightness: " + averageBright);
  //println("Total Hue: " + totalHue);
  //println("Average Hue: " + averageHue);
  //println("Total Sat: " + totalSat);
  //println("Average Sat: " + averageSat);
  float averageHSB = (float) (averageBright + averageHue + averageSat)/3;
  println("Average HSB: " + averageHSB);
  // make conditional to examine the given pixel row
  //String condition = "Null";
  //if (averageHSB > 60 && averageHSB < 70) {
  //  condition = "Grass";
  //} else if (averageHSB > 120 && averageHSB < 132) {
  //  condition = "Blue Sky With Few Clouds";
  //} else if (averageHSB > 70 && averageHSB < 120) {
  //  condition = "Fluffy Clouds";
  //}
  if (averageHSB > 40000) {
    println("Summer");
  } else if (averageHSB > 25000) {
    println("Fall");
  }
}
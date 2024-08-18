// Logic for the way colors are chosen in the given application

// Defining an array personalityColors containing 10 colors representing personality traits as defined in the given research paper. 
// each specified using RGB values.
color[] personalityColors = {
  color(255, 0, 0),    // Red
  color(255, 165, 0),  // Orange
  color(255, 255, 0),  // Yellow
  color(0, 255, 0),    // Green
  color(0,255,255), // Light Blue
  color(0, 0, 255),    // Dark Blue
  color(128, 0, 128),  // Purple
  color(255),          // White
  color(128),          // Gray
  color(0)             // Black
};


// Initializing a 10x10 boolean array colorCombinationsUsed to keep track of used color combinations. 
// Each color combination is represented by a pair of indices.
boolean[][] colorCombinationsUsed = new boolean[10][10];


int lastChosenColorIndex = 0; // Variable to store the index of the last chosen color


// The getRandomUnusedColor() function randomly selects an unused color index from the array. 
// This avoids the index of the last chosen color to prevent consecutive repetition
int getRandomUnusedColor() {
  int colorIndex;
  do {
    colorIndex = floor(random(10));
  } while (colorCombinationsUsed[colorIndex][colorIndex] || colorIndex == lastChosenColorIndex);

  // Mark the color combination as used
  colorCombinationsUsed[colorIndex][colorIndex] = true;

  // Update lastChosenColorIndex for the next question
  lastChosenColorIndex = colorIndex;

  return colorIndex;
}
// getRandomUnusedColor() ends


// Resetting used color combinations for each new question
void resetColorCombinationsUsed() {
  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      colorCombinationsUsed[i][j] = false;
    }
  }
}
// resetColorCombinationsUsed() ends


// The containsColor() function checks if the given array contains a specific color (newColor).
// It iterates through the array and returns true if the color is found, indicating that the array already contains the color.
boolean containsColor(int[] array, int newColor) {
  for (int i = 0; i < array.length; i++) {
    if (array[i] == newColor) {
      return true;
    }
  }
  return false;
}
// containsColor() ends

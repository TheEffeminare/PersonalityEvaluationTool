// Intro screen's text and "Let's Go" button placement is defined here.

PImage backgroundImage;
PImage backgroundImage2;
boolean introScreen = true;
PFont customFont; // using a custom font for aesthetics, OTF file is added to the data folder.
int[] uniqueColors;


void displayIntroScreen() {
  background(backgroundImage);//defined a custom background image for added visual appeal
  textFont(customFont);
  textAlign(CENTER);
  // Displaying "Welcome to the Big 5 Personality Test" in bold letters
  textSize(28);
  fill(0);
  text("Welcome to the Big 5 Personality Assessment!", width/4 + 194, height / 4);

  // Displaying the introductory message here
  textSize(20);
  fill(0);
  text("Take this FUN little test.", width / 3 + 14 + 100, height / 2 - 50);

  // Display the second line of the introductory message
  text("The results of this test are def NOT scientifically proven.", width / 3 + 120, height / 2 - 10);
  text("But hey! Go ahead, live a little :P", width / 3 + 120, height / 2 + 20);

  // Displaying the "Start" button in baby pink
  fill(color(255, 182, 193)); // Baby pink color
  rect(width / 2 - 76, height / 2 + 50, 120, 40, 10);
  fill(0);
  textSize(17);
  text("LET'S GO!", width/2 - 16, height / 2 + 75);
}

// displayIntroScreen() ends

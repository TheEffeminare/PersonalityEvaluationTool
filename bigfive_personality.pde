// Welcome to the 'Big Five Personality Profile Assessment' by Anwesh Kumar Sahoo (123103755)
// Ideally, the Big Five Personality Profile Assessment is a psychological tool that evaluates an individual's personality 
// across five major traits: Openness, Conscientiousness, Extraversion, Agreeableness, and Neuroticism. 
// This application is an implementation of this very psychological model.
// I have explained what each of the function does in every tab for the reader's context.
// Please note that this is just a fun little application and is not scientifically proven, but will definitely keep the user hooked and entertained. :)

import processing.core.PApplet;
import processing.core.PImage;
import processing.core.PFont;
import java.util.Arrays;  


int totalQuestions = 15; // Total number of questions asked in the test
int currentQuestion = 1;
int[] personalityFactors = new int[5]; // Array to store scores for each personality factor
boolean questionAnswered = false; // Flagging to track whether the question has been answered


void setup() {
  size(800, 400);
  backgroundImage = loadImage("background2.jpg"); 
  backgroundImage2 = loadImage("background3.jpg");
  
  customFont = createFont("texgyreadventor-regular.otf", 16); //using a custom font here. OTF file included in the folder
  getRandomUnusedColor();
  displayIntroScreen();
  
  // Populating the colorTraitMap with color indices and associated traits
  // Initializing and populate the colorTraitMap
  colorTraitMap = new HashMap<Integer, String>();
  colorTraitMap.put(0, "Openness");
  colorTraitMap.put(1, "Extraversion");
  colorTraitMap.put(2, "Extraversion");
  colorTraitMap.put(3, "Agreeableness");
  colorTraitMap.put(4, "Openness");
  colorTraitMap.put(5, "Openness");
  colorTraitMap.put(6, "Conscientiousness");
  colorTraitMap.put(7, "Agreeableness");
  colorTraitMap.put(8, "Neuroticism");
  colorTraitMap.put(9, "Neuroticism");
}
//setup() ends


void draw() {
  // Drawing code
}
//draw ends

// The getUserChoice() function calculates and returns the chosen color index based on the mouse click coordinates, considering box size and spacing of 20 units.
int getUserChoice(int x, int y) {
  int chosenColorIndex = (x - 20) / 120; // For box size and spacing, 20 units of space between subsequent boxes
  return chosenColorIndex;
}
//getUserChoice() ends


// The displayQuestion() function displays a question screen with two randomly chosen colors from the pre-dfined personalityColors array for the user to select. 
// Once selected, it updates the color combinations used and prints the hexadecimal values of the chosen colors in the console (for my reference). 
// The question number and total questions are also displayed.
void displayQuestion() {
  background(backgroundImage);
  fill(0);
  textSize(18);

  textAlign(CENTER);
  text("Choose your preferred color from the options below :)", 400, 25);

  int boxSize = 280; // Each color box is of 280 units
  int totalBoxWidth = 2 * boxSize + 20;
  int startX = (width - totalBoxWidth) / 2;

  for (int i = 0; i < 2; i++) {
    int colorIndex = getRandomUnusedColor();
    fill(personalityColors[colorIndex]);
    rect(startX + i * (boxSize + 20), 50, boxSize, boxSize);
    colorCombinationsUsed[colorIndex][colorIndex] = true;

    // Add this print statement to display the color used
    println("Color used: " + hex(personalityColors[colorIndex]));
  }

  fill(75, 0, 130);
  text("Question " + currentQuestion + "/" + totalQuestions, width / 2, height - 20);

  questionAnswered = false;
}
//displayQuestion() ends


// This function displays the personality profile screen, including a disclaimer, a calculated closing message, and buttons for restarting or exiting the assessment. 
void displayPersonalityProfile() {
  background(backgroundImage2);
  fill(0);
  textSize(14);
  text("Please note that the results of this test are not scientifically proven. This is just a fun little test :)", 400, 30);

  String closingMessage = calculateClosingMessage();

  // Displaying closing message in the center
  textSize(22);
  fill(2, 25, 199);
  textAlign(CENTER);
  text(closingMessage, width/2, height/2 - 50);

  // Displaying buttons
  displayButtons();
}
//displayPersonalityProfile() ends


// For the 2 display buttons at the end to start over, or to exit the application
void displayButtons() {
  // "Let's GO AGAIN?" button, to take the test again.
  fill(color(255, 182, 193)); // Baby pink color
  rect(width / 4, height / 2 + 50, 180, 40, 10);
  fill(0);
  textSize(17);
  textAlign(CENTER);
  text("Let's GO AGAIN?", width / 4 + 90, height / 2 + 75);

  // "I've HAD IT!" button which is ideally the exit button here
  fill(color(255, 182, 193)); // Baby pink color
  rect(3 * width / 4 - 180, height / 2 + 50, 180, 40, 10);
  fill(0);
  textSize(17);
  textAlign(CENTER);
  text("I've HAD IT!", 3 * width / 4 - 90, height / 2 + 75);
}
//displayButtons() ends

// The calculateClosingMessage() function generates a closing message based on the personality factors, 
// adding traits such as "inventive", "organized" or "outgoing" if the corresponding factors meet a threshold. 
// Additionally, it randomly includes keywords like "ambitious" or "creative" to enhance the personality description.
String calculateClosingMessage() {
 
  String closingMessage = "Thank you for taking the test. \n You're DEFO SLAYING THE HOUSE DOWN BOOTS!! \n";

  ArrayList<String> traitsList = new ArrayList<String>();

  // Checking each personality factor and adding corresponding trait to the list
  if (personalityFactors[0] >= 4) {
    traitsList.add("inventive");
  } 
  if (personalityFactors[1] >= 4) {
    traitsList.add("organized");
  } 
  if (personalityFactors[2] >= 4) {
    traitsList.add("outgoing");
  }
  if (personalityFactors[3] >= 4) {
    traitsList.add("friendly");
  }
  if (personalityFactors[4] >= 4) {
    traitsList.add("sensitive");
  }

  // Randomly adding more keywords to the traitsList
  if (random(1) > 0.5) {
    traitsList.add("ambitious");
  }
  if (random(1) > 0.5) {
    traitsList.add("creative");
  }
  if (random(1) > 0.5) {
    traitsList.add("adventurous");
  }

  // Concatenating the traits into a single line with "and" between the second last and last words
  if (!traitsList.isEmpty()) {
    closingMessage += "You are ";
    int size = traitsList.size();
    for (int i = 0; i < size; i++) {
      closingMessage += traitsList.get(i);
      if (i < size - 2) {
        closingMessage += ", ";
      } else if (i == size - 2) {
        closingMessage += ", and ";
      }
    }
    closingMessage += ". ";
  }

  return closingMessage;
}
//calculateClosingMessage() ends

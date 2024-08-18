
// The mousePressed() function handles mouse clicks and performs different actions based on the current state of the application.
// If on the intro screen, it checks if the mouse is clicked within the "LET'S GO!" button's bounds and proceeds to display the first question if clicked.
// If not on the intro screen and a question is displayed, it checks if the mouse is clicked within the bounds of one of the two colored squares.
// If clicked, it updates personality factors, marks the question as answered, and proceeds to the next question or displays the personality profile if all questions are answered.
// In the end, if the restart button (i.e. LET's GO AGAIN) is clicked, it resets the application for a new assessment; 
// if the exit button (i.e. I'VE HAD IT) is clicked, it exits the application.

void mousePressed() {
  if (introScreen) {
    if (mouseX > width / 2 - 76 && mouseX < width / 2 + 44 && mouseY > height / 2 + 50 && mouseY < height / 2 + 90) {
      introScreen = false;
      displayQuestion();
    }
  } else if (currentQuestion <= totalQuestions && !questionAnswered) {
    int boxSize = 280;

    int totalBoxWidth = 2 * boxSize + 20;
    int startX = (width - totalBoxWidth) / 2;

    for (int i = 0; i < 2; i++) {
      int minX = startX + i * (boxSize + 20);
      int maxX = minX + boxSize;
      int minY = 50;
      int maxY = minY + boxSize;

      if (mouseX > minX && mouseX < maxX && mouseY > minY && mouseY < maxY) {
        updatePersonalityFactors(i);
        questionAnswered = true;
        
        if (currentQuestion < totalQuestions) {
          currentQuestion++;
          resetColorCombinationsUsed(); // Resetting color combinations for each new question
          displayQuestion();
        } else {
          displayPersonalityProfile(); // Once done, displays the final result
        }


      }
    }
  } else {
    int restartButtonX = width / 4;
    int restartButtonWidth = 180;
    if (mouseX > restartButtonX && mouseX < restartButtonX + restartButtonWidth && mouseY > height / 2 + 50 && mouseY < height / 2 + 90) {
      introScreen = true;
      currentQuestion = 1;
      Arrays.fill(personalityFactors, 0);
      questionAnswered = false;
      resetColorCombinationsUsed();
      displayIntroScreen();
    }

    int exitButtonX = 3 * width / 4 - 180;
    int exitButtonWidth = 180;
    if (mouseX > exitButtonX && mouseX < exitButtonX + exitButtonWidth && mouseY > height / 2 + 50 && mouseY < height / 2 + 90) {
      exit();
    }
  }
}
// mousePressed() ends

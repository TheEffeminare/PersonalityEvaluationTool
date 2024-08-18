
// The updatePersonalityFactors() function updates the personality factors based on the trait associated with the chosen color index, 
// incrementing the corresponding factor by 2 points if a valid trait is found in the colorTraitMap. 
// The traits considered are "Openness," "Conscientiousness," "Extraversion," "Agreeableness," and "Neuroticism," and the associated personality factors are incremented accordingly.

import java.util.HashMap;

// Defining the HashMap to map color indices to personality traits
HashMap<Integer, String> colorTraitMap = new HashMap<Integer, String>();


void updatePersonalityFactors(int chosenColorIndex) {
  // Using the colorTraitMap to get the associated trait for the chosen color
  String trait = colorTraitMap.get(chosenColorIndex);

  // Updating the personality factors based on the associated trait
  if (trait != null) {
    switch (trait) {
      case "Openness":
        personalityFactors[0] += 2; // Increment Openness factor
        break;
      case "Conscientiousness":
        personalityFactors[1] += 2; // Increment Conscientiousness factor
        break;
      case "Extraversion":
        personalityFactors[2] += 2; // Increment Extraversion factor
        break;
      case "Agreeableness":
        personalityFactors[3] += 2; // Increment Agreeableness factor
        break;
      case "Neuroticism":
        personalityFactors[4] += 2; // Increment Neuroticism factor
        break;
    }
  }
}
// updatePersonalityFactors() ends

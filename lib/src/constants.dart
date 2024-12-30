// This file defines constants for BMI ranges and activity multipliers.
// The constants are tailored to provide more personalized results.

/// BMI ranges based on age and gender.
const Map<String, Map<String, List<double>>> bmiRanges = {
  "male": {
    "child": [
      14.5,
      18.5
    ], // Underweight and Overweight ranges for male children.
    "adult": [18.5, 24.9], // Underweight and Overweight ranges for male adults.
    "elderly": [
      23.0,
      29.9
    ] // Underweight and Overweight ranges for elderly males.
  },
  "female": {
    "child": [
      14.0,
      18.0
    ], // Underweight and Overweight ranges for female children.
    "adult": [
      18.0,
      24.4
    ], // Underweight and Overweight ranges for female adults.
    "elderly": [
      22.5,
      29.5
    ] // Underweight and Overweight ranges for elderly females.
  }
};

/// Activity levels and their respective calorie multipliers.
/// These multipliers adjust the calorie needs based on activity levels.
const Map<String, double> activityMultipliers = {
  "sedentary": 1.2, // Little to no exercise.
  "lightly active": 1.375, // Light exercise/sports 1-3 days/week.
  "moderately active": 1.55, // Moderate exercise/sports 3-5 days/week.
  "very active": 1.725, // Hard exercise/sports 6-7 days/week.
  "extra active": 1.9 // Very hard exercise and physical job.
};

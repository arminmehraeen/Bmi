// This file defines constants for BMI ranges and activity multipliers.
// The constants are tailored to provide more personalized results.

/// BMI ranges based on age and gender.
const Map<String, Map<String, List<double>>> bmiRanges = {
  "male": {
    "child": [
      14.5,
      18.5,
    ], // Underweight and Overweight ranges for male children.
    "adult": [18.5, 24.9], // Underweight and Overweight ranges for male adults.
    "elderly": [
      23.0,
      29.9,
    ], // Underweight and Overweight ranges for elderly males.
  },
  "female": {
    "child": [
      14.0,
      18.0,
    ], // Underweight and Overweight ranges for female children.
    "adult": [
      18.0,
      24.4,
    ], // Underweight and Overweight ranges for female adults.
    "elderly": [
      22.5,
      29.5,
    ], // Underweight and Overweight ranges for elderly females.
  },
};

class BmiConstants {
  // BMI Categories
  static const Map<String, List<double>> bmiCategories = {
    'Underweight': [0, 18.5],
    'Normal weight': [18.5, 25],
    'Overweight': [25, 30],
    'Obesity class I': [30, 35],
    'Obesity class II': [35, 40],
    'Obesity class III': [40, double.infinity],
  };

  // Activity Level Multipliers
  static const Map<String, double> activityMultipliers = {
    'sedentary': 1.2,
    'lightlyActive': 1.375,
    'moderatelyActive': 1.55,
    'veryActive': 1.725,
    'extraActive': 1.9,
  };

  // Waist-to-Height Ratio Categories
  static const Map<String, List<double>> waistToHeightCategories = {
    'Very Slim': [0, 0.35],
    'Slim': [0.35, 0.45],
    'Healthy': [0.45, 0.55],
    'Overweight': [0.55, 0.65],
    'Obese': [0.65, double.infinity],
  };

  // Body Fat Percentage Categories
  static const Map<String, Map<String, List<double>>> bodyFatCategories = {
    'male': {
      'Essential': [0, 3],
      'Athletic': [3, 13],
      'Fitness': [13, 17],
      'Average': [17, 24],
      'Obese': [24, double.infinity],
    },
    'female': {
      'Essential': [0, 12],
      'Athletic': [12, 20],
      'Fitness': [20, 24],
      'Average': [24, 31],
      'Obese': [31, double.infinity],
    },
  };

  // Conversion Factors
  static const double kgToLbs = 2.20462;
  static const double cmToInch = 0.393701;
  static const double inchToCm = 2.54;
  static const double lbsToKg = 0.453592;
}

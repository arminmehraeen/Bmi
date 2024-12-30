import 'dart:math';
import 'bmi_model.dart';
import 'constants.dart';

/// Controller for advanced BMI calculations, BMR estimation, and calorie suggestions.
class AdvancedBmiController {
  late AdvancedBmiModel _model; // Holds the last calculated BMI model.

  /// Calculates BMI, BMR, and calorie suggestions based on input data.
  AdvancedBmiModel calculate({
    required double weight,        // Weight in kilograms.
    required double height,        // Height in centimeters.
    required int age,              // Age in years.
    required String gender,        // Gender: 'male' or 'female'.
    required String activityLevel, // Activity level: 'sedentary', 'lightly active', etc.
  }) {
    // Validate inputs
    if (weight <= 0 || height <= 0 || age <= 0) {
      throw ArgumentError('Weight, height, and age must be positive values.');
    }

    // Calculate BMI: weight (kg) divided by height (m) squared.
    double bmi = weight / pow(height / 100, 2);

    // Determine age category: child, adult, elderly.
    String category = _determineCategory(age);

    // Determine BMI status: Underweight, Normal, Overweight.
    String status = _determineBmiStatus(bmi, gender, category);

    // Calculate Basal Metabolic Rate (BMR) using the Harris-Benedict equation.
    double bmr = _calculateBmr(weight, height, age, gender);

    // Suggest daily calorie intake based on activity level.
    Map<String, double> calorieSuggestions = _suggestCalories(bmr, activityLevel);

    // Create an AdvancedBmiModel instance with all calculated data.
    _model = AdvancedBmiModel(
      weight: weight,
      height: height,
      bmi: bmi,
      status: status,
      category: category,
      bmr: bmr,
      calorieSuggestions: calorieSuggestions,
    );

    return _model;
  }

  /// Determines the age category based on the given age.
  String _determineCategory(int age) {
    if (age < 18) return "child";
    if (age < 65) return "adult";
    return "elderly";
  }

  /// Determines the BMI status based on BMI value, gender, and age category.
  String _determineBmiStatus(double bmi, String gender, String category) {
    // Retrieve BMI ranges for the given gender and category.
    List<double> ranges = bmiRanges[gender]?[category] ?? [18.5, 24.9];
    if (bmi < ranges[0]) return "Underweight";
    if (bmi <= ranges[1]) return "Normal";
    return "Overweight";
  }

  /// Calculates Basal Metabolic Rate (BMR) using the Harris-Benedict equation.
  double _calculateBmr(double weight, double height, int age, String gender) {
    if (gender == "male") {
      return 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else if (gender == "female") {
      return 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    } else {
      throw ArgumentError('Invalid gender. Expected "male" or "female".');
    }
  }

  /// Suggests daily calorie intake for maintenance and weight loss goals.
  Map<String, double> _suggestCalories(double bmr, String activityLevel) {
    // Retrieve activity multiplier based on the activity level.
    double multiplier = activityMultipliers[activityLevel] ?? 1.2;
    double calories = bmr * multiplier;

    // Return calorie suggestions for maintenance and weight loss.
    return {
      "maintenance": calories,
      "mild_weight_loss": calories - 250,
      "aggressive_weight_loss": calories - 500,
    };
  }

  /// Retrieves the last calculated BMI model.
  AdvancedBmiModel get data => _model;
}

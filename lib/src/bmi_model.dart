// This file defines the data model used to encapsulate the results of the advanced BMI calculator.

/// A data model for advanced BMI calculations.
/// It includes BMI, status, BMR, and calorie suggestions.
class AdvancedBmiModel {
  final double weight;  // Weight in kilograms.
  final double height;  // Height in centimeters.
  final double bmi;     // Calculated BMI value.
  final String status;  // BMI status (e.g., Normal, Underweight, Overweight).
  final String category; // Age category (child, adult, elderly).
  final double bmr;     // Basal Metabolic Rate (calories needed at rest).
  final Map<String, double> calorieSuggestions; // Suggested calorie intake based on activity levels.

  const AdvancedBmiModel({
    required this.weight,
    required this.height,
    required this.bmi,
    required this.status,
    required this.category,
    required this.bmr,
    required this.calorieSuggestions,
  });

  @override
  String toString() {
    return '''
AdvancedBmiModel(
  weight: $weight, 
  height: $height, 
  bmi: $bmi, 
  status: $status, 
  category: $category,
  bmr: $bmr,
  calorieSuggestions: $calorieSuggestions
)''';
  }
}

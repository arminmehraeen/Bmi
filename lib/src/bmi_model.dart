// This file defines the data model used to encapsulate the results of the advanced BMI calculator.

/// A data model for advanced BMI calculations.
/// It includes BMI, status, BMR, and calorie suggestions.
class AdvancedBmiModel {
  final double weight; // Weight in kilograms.
  final double height; // Height in centimeters.
  final double bmi; // Calculated BMI value.
  final String status; // BMI status (e.g., Normal, Underweight, Overweight).
  final String category; // Age category (child, adult, elderly).
  final double bmr; // Basal Metabolic Rate (calories needed at rest).
  final Map<String, double>
  calorieSuggestions; // Suggested calorie intake based on activity levels.

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

class BmiResult {
  final double bmi;
  final String category;
  final double bmr;
  final double dailyCalories;
  final double bodyFatPercentage;
  final double idealWeightMin;
  final double idealWeightMax;
  final double waistToHeightRatio;
  final String waistToHeightCategory;
  final Map<String, dynamic> recommendations;

  BmiResult({
    required this.bmi,
    required this.category,
    required this.bmr,
    required this.dailyCalories,
    required this.bodyFatPercentage,
    required this.idealWeightMin,
    required this.idealWeightMax,
    required this.waistToHeightRatio,
    required this.waistToHeightCategory,
    required this.recommendations,
  });

  Map<String, dynamic> toJson() {
    return {
      'bmi': bmi,
      'category': category,
      'bmr': bmr,
      'dailyCalories': dailyCalories,
      'bodyFatPercentage': bodyFatPercentage,
      'idealWeightMin': idealWeightMin,
      'idealWeightMax': idealWeightMax,
      'waistToHeightRatio': waistToHeightRatio,
      'waistToHeightCategory': waistToHeightCategory,
      'recommendations': recommendations,
    };
  }
}

enum MeasurementSystem { metric, imperial }

enum ActivityLevel {
  sedentary,
  lightlyActive,
  moderatelyActive,
  veryActive,
  extraActive,
}

enum Gender { male, female }

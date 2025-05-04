import 'bmi_model.dart';
import 'constants.dart';

/// Controller for advanced BMI calculations, BMR estimation, and calorie suggestions.
class AdvancedBmiController {
  late AdvancedBmiModel _model; // Holds the last calculated BMI model.

  /// Calculates comprehensive health metrics based on user inputs
  BmiResult calculate({
    required double weight,
    required double height,
    required int age,
    required String gender,
    required String activityLevel,
    double? waistCircumference,
    MeasurementSystem measurementSystem = MeasurementSystem.metric,
  }) {
    // Validate inputs
    if (weight <= 0) {
      throw ArgumentError('Weight must be greater than 0');
    }
    if (height <= 0) {
      throw ArgumentError('Height must be greater than 0');
    }
    if (age <= 0) {
      throw ArgumentError('Age must be greater than 0');
    }
    if (!['male', 'female'].contains(gender.toLowerCase())) {
      throw ArgumentError('Gender must be either "male" or "female"');
    }
    if (!BmiConstants.activityMultipliers.containsKey(activityLevel)) {
      throw ArgumentError('Invalid activity level');
    }

    // Convert to metric if input is in imperial
    if (measurementSystem == MeasurementSystem.imperial) {
      weight = weight * BmiConstants.lbsToKg;
      height = height * BmiConstants.inchToCm;
      waistCircumference = waistCircumference != null
          ? waistCircumference * BmiConstants.inchToCm
          : null;
    }

    // Calculate BMI
    const minBmi = 18.5;
    const maxBmi = 24.9;
    final bmi = _calculateBmi(weight, height);
    final category = _getBmiCategory(bmi);

    // Calculate BMR
    final bmr = _calculateBmr(weight, height, age, gender);

    // Calculate daily calories
    final dailyCalories = _calculateDailyCalories(bmr, activityLevel);

    // Calculate body fat percentage
    final bodyFatPercentage = _calculateBodyFatPercentage(bmi, age, gender);

    // Calculate ideal weight range
    final heightInMeters = height / 100;
    final idealWeightMin = minBmi * (heightInMeters * heightInMeters);
    final idealWeightMax = maxBmi * (heightInMeters * heightInMeters);

    // Calculate waist-to-height ratio if waist circumference is provided
    double waistToHeightRatio = 0;
    String waistToHeightCategory = 'Not available';
    if (waistCircumference != null) {
      waistToHeightRatio = waistCircumference / height;
      waistToHeightCategory = _getWaistToHeightCategory(waistToHeightRatio);
    }

    // Generate recommendations
    final recommendations = _generateRecommendations(
      bmi,
      category,
      bodyFatPercentage,
      waistToHeightCategory,
    );

    return BmiResult(
      bmi: bmi,
      category: category,
      bmr: bmr,
      dailyCalories: dailyCalories,
      bodyFatPercentage: bodyFatPercentage,
      idealWeightMin: idealWeightMin,
      idealWeightMax: idealWeightMax,
      waistToHeightRatio: waistToHeightRatio,
      waistToHeightCategory: waistToHeightCategory,
      recommendations: recommendations,
    );
  }

  double _calculateBmi(double weight, double height) {
    final heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  String _getBmiCategory(double bmi) {
    for (final entry in BmiConstants.bmiCategories.entries) {
      if (bmi >= entry.value[0] && bmi < entry.value[1]) {
        return entry.key;
      }
    }
    return 'Unknown';
  }

  double _calculateBmr(double weight, double height, int age, String gender) {
    if (gender.toLowerCase() == 'male') {
      return 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else {
      return 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }
  }

  double _calculateDailyCalories(double bmr, String activityLevel) {
    final multiplier = BmiConstants.activityMultipliers[activityLevel] ?? 1.2;
    return bmr * multiplier;
  }

  double _calculateBodyFatPercentage(double bmi, int age, String gender) {
    // Using the Deurenberg formula
    return (1.2 * bmi) +
        (0.23 * age) -
        (10.8 * (gender.toLowerCase() == 'male' ? 1 : 0)) -
        5.4;
  }

  String _getWaistToHeightCategory(double ratio) {
    for (final entry in BmiConstants.waistToHeightCategories.entries) {
      if (ratio >= entry.value[0] && ratio < entry.value[1]) {
        return entry.key;
      }
    }
    return 'Unknown';
  }

  Map<String, dynamic> _generateRecommendations(
    double bmi,
    String category,
    double bodyFatPercentage,
    String waistToHeightCategory,
  ) {
    final recommendations = <String, dynamic>{};

    // BMI-based recommendations
    recommendations['bmi'] = {
      'category': category,
      'suggestion': _getBmiSuggestion(category),
    };

    // Body fat percentage recommendations
    recommendations['bodyFat'] = {
      'percentage': bodyFatPercentage,
      'suggestion': _getBodyFatSuggestion(bodyFatPercentage),
    };

    // Waist-to-height ratio recommendations
    if (waistToHeightCategory != 'Not available') {
      recommendations['waistToHeight'] = {
        'category': waistToHeightCategory,
        'suggestion': _getWaistToHeightSuggestion(waistToHeightCategory),
      };
    }

    return recommendations;
  }

  String _getBmiSuggestion(String category) {
    switch (category) {
      case 'Underweight':
        return 'Consider increasing your calorie intake and focusing on strength training to build muscle mass.';
      case 'Normal weight':
        return 'Maintain your current healthy lifestyle with balanced diet and regular exercise.';
      case 'Overweight':
        return 'Focus on creating a moderate calorie deficit through diet and increasing physical activity.';
      case 'Obesity class I':
      case 'Obesity class II':
      case 'Obesity class III':
        return 'Consult with a healthcare professional to develop a safe and effective weight loss plan.';
      default:
        return 'Maintain a balanced diet and regular exercise routine.';
    }
  }

  String _getBodyFatSuggestion(double percentage) {
    if (percentage < 5) {
      return 'Your body fat percentage is very low. Consider increasing healthy fats in your diet.';
    } else if (percentage < 15) {
      return 'You have a healthy body fat percentage. Maintain your current fitness routine.';
    } else if (percentage < 25) {
      return 'Your body fat percentage is in a good range. Focus on maintaining a balanced diet and regular exercise.';
    } else {
      return 'Consider incorporating more cardio and strength training to reduce body fat percentage.';
    }
  }

  String _getWaistToHeightSuggestion(String category) {
    switch (category) {
      case 'Very Slim':
        return 'Consider increasing your calorie intake and focusing on strength training.';
      case 'Slim':
        return 'Maintain your current healthy lifestyle.';
      case 'Healthy':
        return 'Continue with your current diet and exercise routine.';
      case 'Overweight':
        return 'Focus on creating a moderate calorie deficit and increasing physical activity.';
      case 'Obese':
        return 'Consult with a healthcare professional to develop a safe weight loss plan.';
      default:
        return 'Maintain a balanced diet and regular exercise routine.';
    }
  }

  /// Retrieves the last calculated BMI model.
  AdvancedBmiModel get data => _model;
}

# Advanced BMI Calculator

A comprehensive BMI calculator package that provides detailed health metrics, personalized recommendations, and supports both metric and imperial measurement systems.

## Features

- Calculate BMI with detailed categorization
- Estimate Basal Metabolic Rate (BMR)
- Calculate daily calorie needs based on activity level
- Estimate body fat percentage
- Calculate ideal weight range
- Calculate waist-to-height ratio
- Generate personalized health recommendations
- Support for both metric and imperial measurement systems

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  advanced_bmi: ^1.0.0
```

Then run:
```bash
dart pub get
```

## Usage

### Basic Usage

```dart
import 'package:advanced_bmi/advanced_bmi.dart';

void main() {
  final controller = AdvancedBmiController();
  
  final result = controller.calculate(
    weight: 70.0, // Weight in kilograms
    height: 175.0, // Height in centimeters
    age: 25,
    gender: 'male',
    activityLevel: ActivityLevel.moderatelyActive.toString().split('.').last,
    waistCircumference: 80.0, // Waist circumference in centimeters
    measurementSystem: MeasurementSystem.metric,
  );

  print('BMI: ${result.bmi.toStringAsFixed(2)}');
  print('Category: ${result.category}');
  print('BMR: ${result.bmr.toStringAsFixed(2)} calories/day');
  print('Daily Calories: ${result.dailyCalories.toStringAsFixed(2)} calories');
  print('Body Fat Percentage: ${result.bodyFatPercentage.toStringAsFixed(2)}%');
  print('Ideal Weight Range: ${result.idealWeightMin.toStringAsFixed(2)} - ${result.idealWeightMax.toStringAsFixed(2)} kg');
  print('Waist-to-Height Ratio: ${result.waistToHeightRatio.toStringAsFixed(2)}');
  print('Waist-to-Height Category: ${result.waistToHeightCategory}');
  print('\nRecommendations:');
  print('BMI: ${result.recommendations['bmi']['suggestion']}');
  print('Body Fat: ${result.recommendations['bodyFat']['suggestion']}');
  print('Waist-to-Height: ${result.recommendations['waistToHeight']['suggestion']}');
}
```

### Using Imperial Measurements

```dart
final result = controller.calculate(
  weight: 154.0, // Weight in pounds
  height: 68.9,  // Height in inches
  age: 25,
  gender: 'male',
  activityLevel: ActivityLevel.moderatelyActive.toString().split('.').last,
  waistCircumference: 31.5, // Waist circumference in inches
  measurementSystem: MeasurementSystem.imperial,
);
```

## API Reference

### AdvancedBmiController

The main controller class for BMI calculations.

#### Methods

##### calculate

```dart
BmiResult calculate({
  required double weight,
  required double height,
  required int age,
  required String gender,
  required String activityLevel,
  double? waistCircumference,
  MeasurementSystem measurementSystem = MeasurementSystem.metric,
})
```

Calculates comprehensive health metrics based on user inputs.

**Parameters:**
- `weight`: Weight in kilograms (metric) or pounds (imperial)
- `height`: Height in centimeters (metric) or inches (imperial)
- `age`: Age in years
- `gender`: 'male' or 'female'
- `activityLevel`: One of: 'sedentary', 'lightlyActive', 'moderatelyActive', 'veryActive', 'extraActive'
- `waistCircumference`: Waist circumference in centimeters (metric) or inches (imperial)
- `measurementSystem`: Either `MeasurementSystem.metric` or `MeasurementSystem.imperial`

**Returns:**
A `BmiResult` object containing all calculated metrics and recommendations.

### BmiResult

Contains the results of BMI calculations and health metrics.

**Properties:**
- `bmi`: Calculated BMI value
- `category`: BMI category (e.g., 'Normal weight', 'Overweight')
- `bmr`: Basal Metabolic Rate in calories per day
- `dailyCalories`: Estimated daily calorie needs based on activity level
- `bodyFatPercentage`: Estimated body fat percentage
- `idealWeightMin`: Minimum ideal weight in kilograms
- `idealWeightMax`: Maximum ideal weight in kilograms
- `waistToHeightRatio`: Waist-to-height ratio
- `waistToHeightCategory`: Waist-to-height category
- `recommendations`: Personalized health recommendations

### ActivityLevel

Enum representing different activity levels:
- `sedentary`: Little to no exercise
- `lightlyActive`: Light exercise/sports 1-3 days/week
- `moderatelyActive`: Moderate exercise/sports 3-5 days/week
- `veryActive`: Hard exercise/sports 6-7 days/week
- `extraActive`: Very hard exercise and physical job

### MeasurementSystem

Enum representing measurement systems:
- `metric`: Uses kilograms, centimeters
- `imperial`: Uses pounds, inches

## BMI Categories

- Underweight: < 18.5
- Normal weight: 18.5 - 24.9
- Overweight: 25 - 29.9
- Obesity class I: 30 - 34.9
- Obesity class II: 35 - 39.9
- Obesity class III: ≥ 40

## Waist-to-Height Ratio Categories

- Very Slim: < 0.35
- Slim: 0.35 - 0.45
- Healthy: 0.45 - 0.55
- Overweight: 0.55 - 0.65
- Obese: ≥ 0.65

## Body Fat Percentage Categories

### Male
- Essential: < 3%
- Athletic: 3% - 13%
- Fitness: 13% - 17%
- Average: 17% - 24%
- Obese: ≥ 24%

### Female
- Essential: < 12%
- Athletic: 12% - 20%
- Fitness: 20% - 24%
- Average: 24% - 31%
- Obese: ≥ 31%

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


# Advanced Body Mass Index (BMI) Calculator Flutter Package

This package provides an advanced BMI calculator that calculates not only the BMI but also suggests daily calorie intake based on activity level, computes Basal Metabolic Rate (BMR), and categorizes users based on age.

## Features

- **BMI Calculation**: Calculate BMI based on the provided height and weight.
- **BMR Calculation**: Basal Metabolic Rate (BMR) calculation based on gender, weight, height, and age.
- **Calorie Suggestions**: Daily calorie intake suggestions based on activity level (sedentary, lightly active, etc.).
- **Age Category**: Categorize users as child, adult, or elderly for more accurate health information.
- **Status and Message**: Get the BMI status (e.g., Underweight, Normal, Overweight) and an informative message.

## Getting Started

### Install from pub.dev

To add this package to your Flutter project, include it in your `pubspec.yaml`:

```yaml
dependencies:
  advanced_bmi: ^0.0.2
```

Then, run `flutter pub get` to install the package.

### Install from GitHub

If you'd like to install the package directly from GitHub, use this configuration in your `pubspec.yaml`:

```yaml
dependencies:
  advanced_bmi:
    git:
      url: https://github.com/arminmehraeen/Bmi.git
```

### Import the Package

To use the package, import it as follows:

```dart
import 'package:advanced_bmi/advanced_bmi.dart';
```

## Usage

Here's an example of how to use the BMI and advanced features in your Flutter app:

```dart
import 'package:advanced_bmi/advanced_bmi.dart';

void main() {
  AdvancedBmiController controller = AdvancedBmiController();
  
  // Calculate BMI, BMR, and calorie suggestions for a user
  AdvancedBmiModel bmiModel = controller.calculate(
    weight: 70,       // Weight in kilograms
    height: 180,      // Height in centimeters
    age: 25,          // Age in years
    gender: 'male',   // Gender (either 'male' or 'female')
    activityLevel: 'lightly_active',  // Activity level
  );

  // Access the calculated values
  print('BMI: ${bmiModel.bmi}');
  print('Status: ${bmiModel.status}');
  print('Category: ${bmiModel.category}');
  print('BMR: ${bmiModel.bmr}');
  print('Suggested Calories: ${bmiModel.calorieSuggestions['maintenance']}');
}
```

### Available Data

- `bmiModel.bmi`: The BMI value.
- `bmiModel.status`: The BMI status (e.g., "Underweight", "Normal", "Overweight").
- `bmiModel.category`: The user's age category (e.g., "child", "adult", "elderly").
- `bmiModel.bmr`: The Basal Metabolic Rate (BMR).
- `bmiModel.calorieSuggestions`: A map with daily calorie suggestions for maintenance, mild weight loss, and aggressive weight loss.

## Additional Information

Support this package by starring it on [GitHub](https://github.com/arminmehraeen/Bmi) :heart_on_fire:
```

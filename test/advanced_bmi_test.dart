import 'package:advanced_bmi/src/bmi_controller.dart';
import 'package:advanced_bmi/src/constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AdvancedBmiController controller;

  setUp(() {
    // Initialize the controller before each test
    controller = AdvancedBmiController();
  });

  test('Calculate BMI, BMR, and calorie suggestions', () {
    // Test valid input data
    final weight = 70.0; // kg
    final height = 175.0; // cm
    final age = 25;
    final gender = 'male';
    final activityLevel = 'lightly_active';

    final model = controller.calculate(
      weight: weight,
      height: height,
      age: age,
      gender: gender,
      activityLevel: activityLevel,
    );

    // Test BMI calculation
    expect(model.bmi, closeTo(22.86, 0.1)); // Expected BMI for 70kg, 175cm
    expect(model.status, 'Normal');

    // Test BMR calculation (Harris-Benedict formula for male)
    final expectedBmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    expect(model.bmr, closeTo(expectedBmr, 1.0));

    // Test calorie suggestions
    final expectedCalories = expectedBmr * activityMultipliers[activityLevel]!;
    expect(model.calorieSuggestions['maintenance'], closeTo(expectedCalories, 50.0));
    expect(model.calorieSuggestions['mild_weight_loss'], closeTo(expectedCalories - 250, 50.0));
    expect(model.calorieSuggestions['aggressive_weight_loss'], closeTo(expectedCalories - 500, 50.0));
  });

  test('Calculate BMI with invalid inputs', () {
    // Test invalid inputs (negative weight, zero height)
    expect(() => controller.calculate(
      weight: -70.0,
      height: 175.0,
      age: 25,
      gender: 'male',
      activityLevel: 'lightly_active',
    ), throwsArgumentError);

    expect(() => controller.calculate(
      weight: 70.0,
      height: 0.0,
      age: 25,
      gender: 'male',
      activityLevel: 'lightly_active',
    ), throwsArgumentError);

    expect(() => controller.calculate(
      weight: 70.0,
      height: 175.0,
      age: 0,
      gender: 'male',
      activityLevel: 'lightly_active',
    ), throwsArgumentError);
  });

  test('Calculate BMI with invalid gender input', () {
    // Test invalid gender input
    expect(() => controller.calculate(
      weight: 70.0,
      height: 175.0,
      age: 25,
      gender: 'other', // Invalid gender
      activityLevel: 'lightly_active',
    ), throwsArgumentError);
  });

  test('Calculate BMI for female category', () {
    // Test for female with different activity level
    final model = controller.calculate(
      weight: 60.0,
      height: 160.0,
      age: 30,
      gender: 'female',
      activityLevel: 'moderately_active',
    );

    // Expected BMI for 60kg, 160cm
    expect(model.bmi, closeTo(23.44, 0.1));
    expect(model.status, 'Normal');

    // Test BMR for female (Harris-Benedict formula)
    final expectedBmr = 447.593 + (9.247 * 60) + (3.098 * 160) - (4.330 * 30);
    expect(model.bmr, closeTo(expectedBmr, 1.0));
  });
}

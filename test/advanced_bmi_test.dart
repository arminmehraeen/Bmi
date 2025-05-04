import 'package:advanced_bmi/advanced_bmi.dart';
import 'package:test/test.dart';

void main() {
  late AdvancedBmiController controller;

  setUp(() {
    controller = AdvancedBmiController();
  });

  group('Basic BMI Calculations', () {
    test('Calculate comprehensive health metrics', () {
      final result = controller.calculate(
        weight: 70.0,
        height: 175.0,
        age: 25,
        gender: 'male',
        activityLevel:
            ActivityLevel.moderatelyActive.toString().split('.').last,
        waistCircumference: 80.0,
        measurementSystem: MeasurementSystem.metric,
      );

      // Test BMI calculation
      expect(result.bmi, closeTo(22.86, 0.1));
      expect(result.category, 'Normal weight');

      // Test BMR calculation
      final expectedBmr = 88.362 + (13.397 * 70) + (4.799 * 175) - (5.677 * 25);
      expect(result.bmr, closeTo(expectedBmr, 1.0));

      // Test daily calories
      final expectedCalories =
          expectedBmr * BmiConstants.activityMultipliers['moderatelyActive']!;
      expect(result.dailyCalories, closeTo(expectedCalories, 1.0));

      // Test body fat percentage
      final expectedBodyFat = (1.2 * 22.86) + (0.23 * 25) - (10.8 * 1) - 5.4;
      expect(result.bodyFatPercentage, closeTo(expectedBodyFat, 0.1));

      // Test ideal weight range
      final heightInMeters = 175.0 / 100;
      final minWeight = 18.5 * (heightInMeters * heightInMeters);
      final maxWeight = 24.9 * (heightInMeters * heightInMeters);
      expect(result.idealWeightMin, closeTo(minWeight, 0.1));
      expect(result.idealWeightMax, closeTo(maxWeight, 0.1));

      // Test waist-to-height ratio
      expect(result.waistToHeightRatio, closeTo(80.0 / 175.0, 0.01));
      expect(result.waistToHeightCategory, 'Healthy');
    });

    test('Calculate with imperial measurements', () {
      final result = controller.calculate(
        weight: 154.0, // 70 kg in lbs
        height: 68.9, // 175 cm in inches
        age: 25,
        gender: 'male',
        activityLevel:
            ActivityLevel.moderatelyActive.toString().split('.').last,
        waistCircumference: 31.5, // 80 cm in inches
        measurementSystem: MeasurementSystem.imperial,
      );

      // Test BMI calculation (should be same as metric)
      expect(result.bmi, closeTo(22.86, 0.1));
    });
  });

  group('Activity Levels', () {
    test('Calculate with different activity levels', () {
      final activityLevels = [
        ActivityLevel.sedentary,
        ActivityLevel.lightlyActive,
        ActivityLevel.moderatelyActive,
        ActivityLevel.veryActive,
        ActivityLevel.extraActive,
      ];

      for (final level in activityLevels) {
        final levelString = level.toString().split('.').last;
        final result = controller.calculate(
          weight: 70.0,
          height: 175.0,
          age: 25,
          gender: 'male',
          activityLevel: levelString,
        );

        final expectedBmr =
            88.362 + (13.397 * 70) + (4.799 * 175) - (5.677 * 25);
        final expectedCalories =
            expectedBmr * BmiConstants.activityMultipliers[levelString]!;
        expect(result.dailyCalories, closeTo(expectedCalories, 1.0));
      }
    });
  });

  group('Body Fat Categories', () {
    test('Calculate body fat for different categories', () {
      // Test male categories
      final maleResult = controller.calculate(
        weight: 70.0,
        height: 175.0,
        age: 25,
        gender: 'male',
        activityLevel:
            ActivityLevel.moderatelyActive.toString().split('.').last,
      );

      expect(maleResult.bodyFatPercentage, greaterThan(0));

      // Test female categories
      final femaleResult = controller.calculate(
        weight: 60.0,
        height: 165.0,
        age: 25,
        gender: 'female',
        activityLevel:
            ActivityLevel.moderatelyActive.toString().split('.').last,
      );

      expect(femaleResult.bodyFatPercentage, greaterThan(0));
    });
  });

  group('Error Handling', () {
    test('Invalid inputs', () {
      expect(
        () => controller.calculate(
          weight: -70.0,
          height: 175.0,
          age: 25,
          gender: 'male',
          activityLevel:
              ActivityLevel.moderatelyActive.toString().split('.').last,
        ),
        throwsArgumentError,
      );

      expect(
        () => controller.calculate(
          weight: 70.0,
          height: 0.0,
          age: 25,
          gender: 'male',
          activityLevel:
              ActivityLevel.moderatelyActive.toString().split('.').last,
        ),
        throwsArgumentError,
      );

      expect(
        () => controller.calculate(
          weight: 70.0,
          height: 175.0,
          age: 0,
          gender: 'male',
          activityLevel:
              ActivityLevel.moderatelyActive.toString().split('.').last,
        ),
        throwsArgumentError,
      );
    });

    test('Invalid gender', () {
      expect(
        () => controller.calculate(
          weight: 70.0,
          height: 175.0,
          age: 25,
          gender: 'invalid',
          activityLevel:
              ActivityLevel.moderatelyActive.toString().split('.').last,
        ),
        throwsArgumentError,
      );
    });

    test('Invalid activity level', () {
      expect(
        () => controller.calculate(
          weight: 70.0,
          height: 175.0,
          age: 25,
          gender: 'male',
          activityLevel: 'invalid',
        ),
        throwsArgumentError,
      );
    });
  });

  group('Recommendations', () {
    test('Generate appropriate recommendations', () {
      // Test underweight recommendations
      final underweightResult = controller.calculate(
        weight: 50.0,
        height: 175.0,
        age: 25,
        gender: 'male',
        activityLevel:
            ActivityLevel.moderatelyActive.toString().split('.').last,
      );

      expect(
        underweightResult.recommendations['bmi']['suggestion'],
        contains('increasing your calorie intake'),
      );

      // Test overweight recommendations
      final overweightResult = controller.calculate(
        weight: 90.0,
        height: 175.0,
        age: 25,
        gender: 'male',
        activityLevel:
            ActivityLevel.moderatelyActive.toString().split('.').last,
      );

      expect(
        overweightResult.recommendations['bmi']['suggestion'],
        contains('creating a moderate calorie deficit'),
      );
    });
  });
}

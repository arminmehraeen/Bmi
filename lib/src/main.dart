// Entry point for the advanced BMI calculator program.
import 'package:logging/logging.dart';
import 'bmi_controller.dart';
import 'bmi_model.dart';

void main() {
  // Initialize logging
  Logger.root.level = Level.INFO;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.message}');
  });
  final logger = Logger('AdvancedBMI');

  // Initialize the BMI controller.
  final controller = AdvancedBmiController();

  // Example inputs for the calculation.
  final result = controller.calculate(
    weight: 70.0, // Weight in kilograms.
    height: 175.0, // Height in centimeters.
    age: 30, // Age in years.
    gender: "male", // Gender: 'male' or 'female'.
    activityLevel: "moderatelyActive", // Activity level.
    waistCircumference: 80.0, // Waist circumference in centimeters.
    measurementSystem: MeasurementSystem.metric, // Use metric system.
  );

  // Log the detailed result.
  logger.info('BMI: ${result.bmi.toStringAsFixed(2)}');
  logger.info('Category: ${result.category}');
  logger.info('BMR: ${result.bmr.toStringAsFixed(2)} calories/day');
  logger.info(
      'Daily Calories: ${result.dailyCalories.toStringAsFixed(2)} calories');
  logger.info(
      'Body Fat Percentage: ${result.bodyFatPercentage.toStringAsFixed(2)}%');
  logger.info(
    'Ideal Weight Range: ${result.idealWeightMin.toStringAsFixed(2)} - ${result.idealWeightMax.toStringAsFixed(2)} kg',
  );
  logger.info(
    'Waist-to-Height Ratio: ${result.waistToHeightRatio.toStringAsFixed(2)}',
  );
  logger.info('Waist-to-Height Category: ${result.waistToHeightCategory}');
  logger.info('\nRecommendations:');
  logger.info('BMI: ${result.recommendations['bmi']['suggestion']}');
  logger.info('Body Fat: ${result.recommendations['bodyFat']['suggestion']}');
  logger.info(
    'Waist-to-Height: ${result.recommendations['waistToHeight']['suggestion']}',
  );
}

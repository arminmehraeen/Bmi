// Entry point for the advanced BMI calculator program.
import 'bmi_controller.dart';

void main() {
  // Initialize the BMI controller.
  AdvancedBmiController controller = AdvancedBmiController();

  // Example inputs for the calculation.
  final result = controller.calculate(
    weight: 70.0,               // Weight in kilograms.
    height: 175.0,              // Height in centimeters.
    age: 30,                    // Age in years.
    gender: "male",             // Gender: 'male' or 'female'.
    activityLevel: "moderately active", // Activity level.
  );

  // Print the detailed result.
  print(result);
}

import 'bmi_controller.dart';
import 'bmi_model.dart';

class BMI {
  final BmiController _controller = BmiController();

  BMI({required double weight, required double height}) {
    _controller.compute(height: height, weight: weight);
  }

  BmiModel get data => _controller.data;
}

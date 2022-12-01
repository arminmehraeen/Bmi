library bmi;

import 'dart:math';

part './bmi_model.dart';
part './bmi_controller.dart';
part './constants.dart';

class BMI {

  final BmiController _controller = BmiController() ;

  BMI({required double weight , required double height}) {
    _controller.compute(height: height, weight: weight) ;
  }

  BmiModel get data => _controller.data ;
}

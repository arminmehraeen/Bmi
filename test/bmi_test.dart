import 'package:bmi/src/bmi_model.dart';
import 'package:bmi/src/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test', () {
    BmiModel bmi = BMI(height: 180, weight: 70).data;
    expect(bmi.height, 180.0);
    expect(bmi.weight, 70.0);
    expect(bmi.value.round(), 22.0);
    expect(bmi.status, "Normal");
  });
}

import 'package:flutter_test/flutter_test.dart';

import 'package:bmi/bmi.dart';

void main() {
  test('test', () {
    final bmi = BMI(height: 180, weight: 70);
    expect(bmi.data.height, 180.0);
    expect(bmi.data.weight, 70.0);
    expect(bmi.data.bmi.round() , 22.0);
    expect(bmi.data.status, "Normal");
  });
}

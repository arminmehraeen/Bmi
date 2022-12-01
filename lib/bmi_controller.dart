part of bmi;

class BmiController {
  BmiModel _model = BmiModel.empty;

  void compute({required double height, required double weight}) {
    double bmi = (weight.toInt() / pow(height, 2).toInt()) * 10000;
    List detail = _computeDetail(bmi: bmi);
    _model = BmiModel(weight: weight,
        height: height,
        bmi: bmi,
        status: detail[0],
        message: detail[1]);
  }

  List _computeDetail({required double bmi}) {
    int index = _bmiRangeSelector(bmi: bmi) ;
    return [bmiStatus[index] , bmiMessage[index] ] ;
  }

  int _bmiRangeSelector({required double bmi}) {
    if (bmi < 18.5) {
      return 0;
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      return 1;
    } else if (bmi >= 25 && bmi <= 29.9) {
      return 2;
    } else if (bmi >= 30 && bmi <= 34.9) {
      return 3;
    } else if (bmi >= 35) {
      return 4;
    } else {
      return 1;
    }
  }

  BmiModel get data => _model;
}
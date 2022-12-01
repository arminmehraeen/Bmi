part of bmi;



class BmiModel {
  final double weight;
  final double height;
  final double bmi;

  final String status;
  final String message;

  const BmiModel({
    required this.weight,
    required this.height,
    required this.bmi,
    required this.status,
    required this.message,
  });

  static BmiModel get empty =>  BmiModel(
      weight: 0.0,
      height: 0.0,
      bmi: 0.0,
      status: bmiStatus.first ,
      message: bmiMessage.first );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BmiModel &&
          runtimeType == other.runtimeType &&
          weight == other.weight &&
          height == other.height &&
          bmi == other.bmi &&
          status == other.status &&
          message == other.message);

  @override
  int get hashCode =>
      weight.hashCode ^
      height.hashCode ^
      bmi.hashCode ^
      status.hashCode ^
      message.hashCode;

  @override
  String toString() {
    return 'BmiModel{ weight: $weight, height: $height, bmi: $bmi, status: $status, message: $message,}';
  }

  BmiModel copyWith({
    double? weight,
    double? height,
    double? bmi,
    String? status,
    String? message,
  }) {
    return BmiModel(
      weight: weight ?? this.weight,
      height: height ?? this.height,
      bmi: bmi ?? this.bmi,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'weight': weight,
      'height': height,
      'bmi': bmi,
      'status': status,
      'message': message,
    };
  }

  factory BmiModel.fromMap(Map<String, dynamic> map) {
    return BmiModel(
      weight: map['weight'] as double,
      height: map['height'] as double,
      bmi: map['bmi'] as double,
      status: map['status'] as String,
      message: map['message'] as String,
    );
  }

//</editor-fold>
}

import 'dart:math';

class CalculateBmi {
  final int height;
  final int weight;
  late double _bmi;
  CalculateBmi({required this.height, required this.weight});

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more';
    } else if (_bmi > 18) {
      return 'You have a normal body weight';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more';
    }
  }
}

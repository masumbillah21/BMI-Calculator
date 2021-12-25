import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  late double _bmi;

  CalculatorBrain({required this.height, required this.weight});

  double calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return double.parse(_bmi.toStringAsFixed(1));
  }

  String getResult() {
    if (_bmi >= 30) {
      return 'OBESE';
    } else if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}

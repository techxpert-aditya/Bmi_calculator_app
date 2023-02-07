import 'main.dart';
import 'dart:math';

class BMICalculatorBrain {
  final double? height;
  final int? weight;
  late double _bmi;

  BMICalculatorBrain({required this.height, required this.weight});

  String getResults() {
    _bmi = (weight! / pow(height! / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResultText() {
    if (_bmi >= 25) {
      return 'Over Weight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'Under Weight';
    }
  }

  String getResultFeedback() {
    if (_bmi >= 25) {
      return 'you have extra body weight, try exercising more!';
    } else if (_bmi >= 18.5) {
      return 'you have normal body weight, great job!';
    } else {
      return 'you have less body weight, try to eat more!';
    }
  }
}

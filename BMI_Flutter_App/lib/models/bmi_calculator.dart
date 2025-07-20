import 'dart:math';

class BMICalculator {
  final int weight;
  final double heightCm;

  BMICalculator({required this.weight, required this.heightCm});

  double calculateBMI() {
    double heightM = heightCm / 100;
    return weight / pow(heightM, 2);
  }

  String getResult() {
    double bmi = calculateBMI();

    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  String getInterpretation() {
    double bmi = calculateBMI();

    if (bmi < 18.5) {
      return 'You have a lower than normal body weight. Try to eat more.';
    } else if (bmi < 25) {
      return 'You have a normal body weight. Good job!';
    } else if (bmi < 30) {
      return 'You have a slightly higher than normal body weight. Try to exercise more.';
    } else {
      return 'You have a much higher than normal body weight. Consult your doctor.';
    }
  }
}
import 'package:flutter/material.dart';
import 'package:bmi_flutter_app/models/bmi_calculator.dart';
import 'result_screen.dart';
import 'package:bmi_flutter_app/widgets/gender_selector.dart';
import 'package:bmi_flutter_app/widgets/height_slider.dart';
import 'package:bmi_flutter_app/widgets/weight_age_input.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  bool isMale = true;
  double height = 160;
  int weight = 70;
  int age = 23;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8ECF4),
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GenderSelector(
                isMale: isMale,
                onMaleTap: () => setState(() => isMale = true),
                onFemaleTap: () => setState(() => isMale = false),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: HeightSlider(
                height: height,
                onChanged: (val) => setState(() => height = val),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ValueCard(
                      label: 'Weight',
                      value: weight,
                      onDecrement: () => setState(() => weight--),
                      onIncrement: () => setState(() => weight++),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ValueCard(
                      label: 'Age',
                      value: age,
                      onDecrement: () => setState(() => age--),
                      onIncrement: () => setState(() => age++),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    final calculator = BMICalculator(
                      weight: weight,
                      heightCm: height,
                    );
                    final bmi = calculator.calculateBMI();
                    final result = calculator.getResult();
                    final comment = calculator.getInterpretation();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          bmiResult: bmi,
                          resultText: result,
                          interpretation: comment,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Let\'s Go', style: TextStyle(fontSize: 18)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

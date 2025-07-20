import 'package:flutter/material.dart';

class HeightSlider extends StatelessWidget {
  final double height;
  final ValueChanged<double> onChanged;

  const HeightSlider({
    Key? key,
    required this.height,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          const Text(
            'Height',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            '${height.toInt()} cm',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Slider(
            value: height,
            min: 120,
            max: 220,
            activeColor: Colors.blue,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ValueCard extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const ValueCard({
    Key? key,
    required this.label,
    required this.value,
    required this.onIncrement,
    required this.onDecrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 18)),
          Text('$value',
              style: const TextStyle(
                  fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: onDecrement,
                  icon: const Icon(Icons.remove_circle_outline)),
              IconButton(
                  onPressed: onIncrement,
                  icon: const Icon(Icons.add_circle_outline)),
            ],
          )
        ],
      ),
    );
  }
}

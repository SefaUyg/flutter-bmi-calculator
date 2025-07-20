import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  final bool isMale;
  final VoidCallback onMaleTap;
  final VoidCallback onFemaleTap;

  const GenderSelector({
    Key? key,
    required this.isMale,
    required this.onMaleTap,
    required this.onFemaleTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GenderCard(
            label: 'Male',
            icon: Icons.male,
            isSelected: isMale,
            onTap: onMaleTap,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: GenderCard(
            label: 'Female',
            icon: Icons.female,
            isSelected: !isMale,
            onTap: onFemaleTap,
          ),
        ),
      ],
    );
  }
}

class GenderCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderCard({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: isSelected ? Colors.white : Colors.black),
            const SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                color: isSelected ? Colors.white : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}

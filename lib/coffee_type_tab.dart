import 'package:flutter/material.dart';
class CoffeeTypeTab extends StatelessWidget {
  final String coffeeType;
  final bool isSelected;
  final VoidCallback onTap;

  const CoffeeTypeTab({
    super.key,
    required this.coffeeType,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          coffeeType,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: isSelected ? const Color(0xFFcb7c4c) : Colors.white,
          ),
        ),
      ),
    );
  }
}

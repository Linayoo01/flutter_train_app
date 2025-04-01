import 'package:flutter/material.dart';

class SeatWidget extends StatelessWidget {
  final String id;
  final bool isSelected;
  final VoidCallback onTap;

  const SeatWidget({
    super.key,
    required this.id,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Color selectedColor = Colors.purple;
    Color unselectedColor = isDark ? Colors.grey[800]! : Colors.grey[300]!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : unselectedColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

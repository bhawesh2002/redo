import 'package:flutter/material.dart';

class TodoBottomAppBarItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  const TodoBottomAppBarItem({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          icon,
          color: isSelected ? Colors.white : Colors.black,
        ),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        )
      ],
    );
  }
}

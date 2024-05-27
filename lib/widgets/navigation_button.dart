import 'package:flutter/material.dart';

enum Directions { previous, next }

class NavigationButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Directions direction;

  const NavigationButton({
    Key? key,
    required this.onPressed,
    required this.direction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isPrevious = direction == Directions.previous;
    final Icon icon = Icon(
      isPrevious ? Icons.arrow_left : Icons.arrow_right,
      size: 24,
    );
    final String label = isPrevious ? 'Previous' : 'Next';

    return TextButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(label),
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        padding: EdgeInsets.zero, // Remove default padding
      ),
      iconAlignment: isPrevious ? IconAlignment.start : IconAlignment.end,
    );
  }
}

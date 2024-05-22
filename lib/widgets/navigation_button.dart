import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final IconData icon;
  final bool isPrevious;

  const NavigationButton({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.isPrevious = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 24),
      label: Text(label),
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        padding: EdgeInsets.zero, // Remove default padding
      ),
    );
  }
}

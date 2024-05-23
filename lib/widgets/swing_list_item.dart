import 'package:flutter/material.dart';
import 'package:hackmotion_test_assignment/models/swing_model.dart';

class SwingItem extends StatelessWidget {
  final int index;
  final Swing swing;
  final VoidCallback onTap;

  const SwingItem(
      {Key? key, required this.index, required this.swing, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Swing ${index + 1}'),
      trailing: const Icon(Icons.arrow_forward),
      onTap: onTap,
    );
  }
}

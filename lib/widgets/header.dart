import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final int index;
  final int totalSwings;
  final Function(int) onDelete;
  final Function(int) onNavigate;

  const HeaderWidget({
    Key? key,
    required this.index,
    required this.totalSwings,
    required this.onDelete,
    required this.onNavigate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Swing ${index + 1}',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            onDelete(index);
            if (index < totalSwings - 1) {
              onNavigate(index);
            } else if (index > 0) {
              onNavigate(index - 1);
            } else {
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }
}

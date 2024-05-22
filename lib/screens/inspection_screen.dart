import 'package:flutter/material.dart';
import '../models/swing_model.dart';
import '../widgets/swing_chart.dart';

class InspectionScreen extends StatelessWidget {
  final Swing swing;
  final int index;
  final int totalSwings;
  final Function(int) onDelete;
  final Function(int) onNavigate;

  const InspectionScreen({
    Key? key,
    required this.swing,
    required this.index,
    required this.totalSwings,
    required this.onDelete,
    required this.onNavigate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inspection'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
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
      ),
      body: Column(
        children: [
          const Text('Swing graph'),
          Expanded(child: SwingChart(swing: swing)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: index > 0
                    ? () {
                        onNavigate(index - 1);
                      }
                    : null,
                child: const Text('Previous'),
              ),
              TextButton(
                onPressed: index < totalSwings - 1
                    ? () {
                        onNavigate(index + 1);
                      }
                    : null,
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

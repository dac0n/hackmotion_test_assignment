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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 15.0), // Horizontal margin for the entire page
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align all children to the start
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Swing ${index + 1}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
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
            ),
            const Text('Swing graph'),
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 10),
              child: Container(
                padding: const EdgeInsets.all(15.0), // Padding around the chart
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.grey), // Border around the chart
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: MediaQuery.of(context).size.height *
                    0.35, // 35% of screen height
                child: SwingChart(swing: swing),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: index > 0
                      ? () {
                          onNavigate(index - 1);
                        }
                      : null,
                  icon: const Icon(Icons.arrow_left, size: 24),
                  label: const Text('Previous'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                    padding: EdgeInsets.zero, // Remove default padding
                  ),
                ),
                TextButton.icon(
                  onPressed: index < totalSwings - 1
                      ? () {
                          onNavigate(index + 1);
                        }
                      : null,
                  icon: const Icon(Icons.arrow_right, size: 24),
                  label: const Text('Next'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                    padding: EdgeInsets.zero, // Remove default padding
                  ),
                  iconAlignment: IconAlignment.end,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

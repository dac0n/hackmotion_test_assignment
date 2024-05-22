import 'package:flutter/material.dart';
import 'package:my_golf_app/models/swing_model.dart';
import 'package:my_golf_app/widgets/app_bar.dart';
import 'package:my_golf_app/widgets/chart_container.dart';
import 'package:my_golf_app/widgets/header.dart';
import 'package:my_golf_app/widgets/navigation_button.dart';

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
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 15.0), // Horizontal margin for the entire page
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align all children to the start
          children: [
            HeaderWidget(
              index: index,
              totalSwings: totalSwings,
              onDelete: onDelete,
              onNavigate: onNavigate,
            ),
            const Text('Swing graph'),
            ChartContainer(swing: swing),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavigationButton(
                  onPressed: index > 0 ? () => onNavigate(index - 1) : null,
                  label: 'Previous',
                  icon: Icons.arrow_left,
                  isPrevious: true,
                ),
                NavigationButton(
                  onPressed: index < totalSwings - 1
                      ? () => onNavigate(index + 1)
                      : null,
                  label: 'Next',
                  icon: Icons.arrow_right,
                  isPrevious: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

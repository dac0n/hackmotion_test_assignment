import 'package:flutter/material.dart';
import 'package:my_golf_app/models/swing_model.dart';
import 'swing_chart.dart';

class ChartContainer extends StatelessWidget {
  final Swing swing;

  const ChartContainer({Key? key, required this.swing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(15.0), // Padding around the chart
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey), // Border around the chart
          borderRadius: BorderRadius.circular(8.0),
        ),
        height:
            MediaQuery.of(context).size.height * 0.35, // 35% of screen height
        child: SwingChart(swing: swing),
      ),
    );
  }
}

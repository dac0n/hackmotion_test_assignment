import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/swing_model.dart';

class SwingChart extends StatelessWidget {
  final Swing swing;

  const SwingChart({Key? key, required this.swing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: true),
        titlesData: const FlTitlesData(
          leftTitles: AxisTitles(
              sideTitles:
                  SideTitles(showTitles: true, reservedSize: 50, interval: 20)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: swing.parameters.HFA_crWrFlexEx.values
                .asMap()
                .entries
                .map((e) => FlSpot(e.key.toDouble(), e.value))
                .toList(),
            isCurved: true,
            color: Colors.blue,
            barWidth: 2,
            dotData: const FlDotData(show: false), // Hide dots
          ),
          LineChartBarData(
            spots: swing.parameters.HFA_crWrRadUln.values
                .asMap()
                .entries
                .map((e) => FlSpot(e.key.toDouble(), e.value))
                .toList(),
            isCurved: true,
            color: Colors.orange,
            barWidth: 2,
            dotData: const FlDotData(show: false), // Hide dots
          ),
        ],
      ),
    );
  }
}

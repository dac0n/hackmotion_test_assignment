import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/swing_model.dart';

class SwingChart extends StatelessWidget {
  final Swing swing;

  const SwingChart({Key? key, required this.swing}) : super(key: key);

  static const double linesStepAmount = 20;
  static const double reservedSize = 50;

  @override
  Widget build(BuildContext context) {
    final allValues = _getAllValues(swing);
    final boundary = _calculateBoundary(allValues);

    return LineChart(
      LineChartData(
        minY: -boundary,
        maxY: boundary,
        gridData: _buildGridData(),
        titlesData: _buildTitlesData(),
        borderData: FlBorderData(show: false),
        lineBarsData: _buildLineBarsData(),
      ),
    );
  }

  List<double> _getAllValues(Swing swing) {
    return [
      ...swing.parameters.flexionExtension,
      ...swing.parameters.ulnarRadial
    ];
  }

  double _calculateBoundary(List<double> allValues) {
    final maxValue = allValues.fold<double>(0, (prev, element) {
      return element.abs() > prev.abs() ? element.abs() : prev.abs();
    });
    return (maxValue / linesStepAmount).ceil() * linesStepAmount;
  }

  FlGridData _buildGridData() {
    return FlGridData(
      show: true,
      drawHorizontalLine: true,
      drawVerticalLine: false,
      getDrawingHorizontalLine: (value) {
        return const FlLine(
          color: Color.fromARGB(255, 165, 172, 179),
          strokeWidth: 1,
          dashArray: [5, 5],
        );
      },
      horizontalInterval: linesStepAmount,
    );
  }

  FlTitlesData _buildTitlesData() {
    return FlTitlesData(
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: reservedSize,
          interval: linesStepAmount,
          getTitlesWidget: _getTitleWidget,
        ),
      ),
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      bottomTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
    );
  }

  Widget _getTitleWidget(double value, TitleMeta meta) {
    return Container(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Text(
          value.toString(),
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  List<LineChartBarData> _buildLineBarsData() {
    return [
      LineChartBarData(
        spots: _convertToSpots(swing.parameters.flexionExtension),
        isCurved: true,
        color: Colors.blue,
        barWidth: 2,
        dotData: const FlDotData(show: false),
      ),
      LineChartBarData(
        spots: _convertToSpots(swing.parameters.ulnarRadial),
        isCurved: true,
        color: Colors.orange,
        barWidth: 2,
        dotData: const FlDotData(show: false),
      ),
    ];
  }

  List<FlSpot> _convertToSpots(List<double> values) {
    return values
        .asMap()
        .entries
        .map((e) => FlSpot(e.key.toDouble(), e.value))
        .toList();
  }
}

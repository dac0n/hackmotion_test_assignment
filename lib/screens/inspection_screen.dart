import 'package:flutter/material.dart';
import 'package:hackmotion_test_assignment/models/swing_model.dart';
import 'package:hackmotion_test_assignment/widgets/app_bar.dart';
import 'package:hackmotion_test_assignment/widgets/chart_container.dart';
import 'package:hackmotion_test_assignment/widgets/header.dart';
import 'package:hackmotion_test_assignment/widgets/navigation_button.dart';

class InspectionScreen extends StatefulWidget {
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
  _InspectionScreenState createState() => _InspectionScreenState();
}

class _InspectionScreenState extends State<InspectionScreen>
    with SingleTickerProviderStateMixin {
  bool _isAnimating = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300), // Animation duration
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed ||
            status == AnimationStatus.dismissed) {
          setState(() {
            _isAnimating = false;
          });
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _navigate(int newIndex) {
    if (!_isAnimating) {
      setState(() {
        _isAnimating = true;
      });
      widget.onNavigate(newIndex);
      _animationController.forward(from: 0);
    }
  }

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
              index: widget.index,
              totalSwings: widget.totalSwings,
              onDelete: widget.onDelete,
              onNavigate: widget.onNavigate,
            ),
            const Text('Swing graph'),
            ChartContainer(swing: widget.swing),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavigationButton(
                  onPressed: widget.index > 0 && !_isAnimating
                      ? () => _navigate(widget.index - 1)
                      : null,
                  label: 'Previous',
                  icon: Icons.arrow_left,
                  isPrevious: true,
                ),
                NavigationButton(
                  onPressed:
                      widget.index < widget.totalSwings - 1 && !_isAnimating
                          ? () => _navigate(widget.index + 1)
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

import 'package:hackmotion_test_assignment/models/swing_model.dart';

abstract class SwingState {}

class SwingInitial extends SwingState {}

class SwingsLoaded extends SwingState {
  final List<Swing> swings;

  SwingsLoaded({required this.swings});
}

class SwingsError extends SwingState {}

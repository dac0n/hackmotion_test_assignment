import 'package:my_golf_app/models/swing_model.dart';

abstract class SwingState {}

class SwingInitial extends SwingState {}

class SwingsLoaded extends SwingState {
  final List<Swing> swings;

  SwingsLoaded({required this.swings});
}

class SwingsError extends SwingState {}

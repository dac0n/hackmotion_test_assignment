import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackmotion_test_assignment/bloc/swing_state.dart';
import 'package:hackmotion_test_assignment/utils/swing_processor.dart';

class SwingBloc extends Cubit<SwingState> {
  final SwingProcessor swingProcessor;

  SwingBloc({required this.swingProcessor}) : super(SwingInitial());

  void loadSwings() async {
    try {
      final swings = await swingProcessor.getSwings();
      emit(SwingsLoaded(swings: swings));
    } catch (_) {
      emit(SwingsError());
    }
  }
}

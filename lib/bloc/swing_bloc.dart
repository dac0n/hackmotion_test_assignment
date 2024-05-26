import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackmotion_test_assignment/bloc/swing_state.dart';
import 'package:hackmotion_test_assignment/utils/swing_processor.dart';

class SwingBloc extends Cubit<SwingState> {
  final SwingProcessor swingProcessor;

  SwingBloc({required this.swingProcessor}) : super(SwingInitial());

  void loadSwings() async {
    emit(SwingLoading());
    try {
      await for (final swing
          in swingProcessor.getSwings(includeFilePath: true)) {
        final currentState = state;
        if (currentState is SwingsLoaded) {
          emit(
              SwingsLoaded(swings: List.from(currentState.swings)..add(swing)));
        } else {
          emit(SwingsLoaded(swings: [swing]));
        }
      }
    } catch (_) {
      emit(SwingsError());
    }
  }
}

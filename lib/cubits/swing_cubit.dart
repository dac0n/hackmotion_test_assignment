import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hackmotion_test_assignment/cubits/swing_state.dart';
import 'package:hackmotion_test_assignment/utils/swing_processor.dart';

class SwingCubit extends Cubit<SwingState> {
  final SwingProcessor swingProcessor;

  SwingCubit({required this.swingProcessor}) : super(SwingInitial());

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
    } catch (e) {
      emit(SwingsError());
    }
  }
}

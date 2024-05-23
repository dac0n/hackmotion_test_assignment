import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_golf_app/bloc/swing_state.dart';
import 'package:my_golf_app/utils/swing_processor.dart';

class SwingBloc extends Cubit<SwingState> {
  final SwingRepository swingRepository;

  SwingBloc({required this.swingRepository}) : super(SwingInitial());

  void loadSwings() async {
    try {
      final swings = await swingRepository.getSwings();
      emit(SwingsLoaded(swings: swings));
    } catch (_) {
      emit(SwingsError());
    }
  }
}

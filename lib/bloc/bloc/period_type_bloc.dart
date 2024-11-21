import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'period_type_event.dart';
part 'period_type_state.dart';

class PeriodTypeBloc extends Bloc<PeriodTypeEvent, PeriodTypeState> {
  PeriodTypeBloc() : super(const PeriodTypeState(currentIndex: 0)) {
    on<PeriodTypeStarted>(_onPeriodTypeStarted);
    on<PeriodTypeRequestedChanged>(_onPeriodTypeRequestedChange);
  }

  void _onPeriodTypeStarted(
      PeriodTypeStarted event, Emitter<PeriodTypeState> emit) {
    emit(PeriodTypeState(currentIndex: event.index));
  }

  void _onPeriodTypeRequestedChange(
      PeriodTypeRequestedChanged event, Emitter<PeriodTypeState> emit) {
    emit(PeriodTypeState(currentIndex: event.index));
  }
}

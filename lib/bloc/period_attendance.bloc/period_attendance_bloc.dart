import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'period_attendance_event.dart';
part 'period_attendance_state.dart';

class PeriodAttendanceBloc
    extends Bloc<PeriodAttendanceEvent, PeriodAttendanceState> {
  PeriodAttendanceBloc() : super(const PeriodAttendanceState(currentIndex: 0)) {
    on<PeriodAttendanceStarted>(_onPeriodAttendanceStarted);
    on<PeriodAttendanceRequestedChange>(_onPeriodAttendanceRequestedChange);
  }

  void _onPeriodAttendanceStarted(
      PeriodAttendanceStarted event, Emitter<PeriodAttendanceState> emit) {
    emit(PeriodAttendanceState(currentIndex: event.index));
  }

  void _onPeriodAttendanceRequestedChange(PeriodAttendanceRequestedChange event,
      Emitter<PeriodAttendanceState> emit) {
    emit(PeriodAttendanceState(currentIndex: event.index));
  }
}

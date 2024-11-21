import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'late_time_event.dart';
part 'late_time_state.dart';

class LateTimeBloc extends Bloc<LateTimeEvent, LateTimeState> {
  LateTimeBloc() : super(LateTimeInitial()) {
    on<CheckInEvent>(_onCheckIn);
    on<CheckOutEvent>(_onCheckOut);
  }

  // Handle check-in event
  void _onCheckIn(CheckInEvent event, Emitter<LateTimeState> emit) {
    DateTime officeStartTime = DateTime(
      event.checkInTime.year,
      event.checkInTime.month,
      event.checkInTime.day,
      8,
      30,
    );

    int minutesLate = event.checkInTime.isAfter(officeStartTime)
        ? event.checkInTime.difference(officeStartTime).inMinutes
        : 0;

    emit(AttendanceDataState(
      checkInTime: event.checkInTime,
      minutesLate: minutesLate,
      checkOutTime: null,
      minutesLeftEarly: 0,
    ));
  }

  void _onCheckOut(CheckOutEvent event, Emitter<LateTimeState> emit) {
    DateTime endOfWorkDay = DateTime(
      event.checkOutTime.year,
      event.checkOutTime.month,
      event.checkOutTime.day,
      19,
      0,
    );

    int minutesEarly = event.checkOutTime.isBefore(endOfWorkDay)
        ? endOfWorkDay.difference(event.checkOutTime).inMinutes
        : 0;

    emit(AttendanceDataState(
      checkInTime:
          null, // You can hold the previous check-in time here if needed
      minutesLate: 0, // You can hold the previous late time here if needed
      checkOutTime: event.checkOutTime,
      minutesLeftEarly: minutesEarly,
    ));
  }
}

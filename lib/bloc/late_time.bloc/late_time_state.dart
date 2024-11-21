part of 'late_time_bloc.dart';

abstract class LateTimeState extends Equatable {
  const LateTimeState();

  @override
  List<Object> get props => [];
}

class LateTimeInitial extends LateTimeState {}

class CheckInTimeState extends LateTimeState {
  final DateTime checkInTime;
  final int minuteLate;

  const CheckInTimeState({required this.checkInTime, required this.minuteLate});
}

class CheckOutState extends LateTimeState {
  final DateTime checkOutTime;
  final int minuteEarly;

  const CheckOutState({required this.checkOutTime, required this.minuteEarly});
}

class AttendanceDataState extends LateTimeState {
  final DateTime? checkInTime;
  final int minutesLate;
  final DateTime? checkOutTime;
  final int minutesLeftEarly;

  const AttendanceDataState({
    required this.checkInTime,
    required this.minutesLate,
    required this.checkOutTime,
    required this.minutesLeftEarly,
  });
}
part of 'period_attendance_bloc.dart';

class PeriodAttendanceEvent extends Equatable {
  const PeriodAttendanceEvent({required this.index});

  final int index;

  @override
  List<Object> get props => [];
}

class PeriodAttendanceStarted extends PeriodAttendanceEvent {
  const PeriodAttendanceStarted({required super.index});
}

class PeriodAttendanceRequestedChange extends PeriodAttendanceEvent {
  const PeriodAttendanceRequestedChange({required super.index});
}

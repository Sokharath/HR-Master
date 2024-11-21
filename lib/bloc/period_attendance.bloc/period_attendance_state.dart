part of 'period_attendance_bloc.dart';

class PeriodAttendanceState extends Equatable {
  const PeriodAttendanceState({required this.currentIndex});

  final int currentIndex;

  @override
  List<Object> get props => [currentIndex];
}

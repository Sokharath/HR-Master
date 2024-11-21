part of 'late_time_bloc.dart';

sealed class LateTimeEvent extends Equatable {
  const LateTimeEvent();

  @override
  List<Object> get props => [];
}

class CheckInEvent extends LateTimeEvent {
  final DateTime checkInTime;

  const CheckInEvent( this.checkInTime);
}

class CheckOutEvent extends LateTimeEvent {
  final DateTime checkOutTime;

  const CheckOutEvent( this.checkOutTime);
}

part of 'period_type_bloc.dart';

class PeriodTypeEvent extends Equatable {
  const PeriodTypeEvent({required this.index});

  final int index;

  @override
  List<Object> get props => [];
}

class PeriodTypeStarted extends PeriodTypeEvent {
  const PeriodTypeStarted({required super.index});
}


class PeriodTypeRequestedChanged extends PeriodTypeEvent {
  const PeriodTypeRequestedChanged({required super.index});
}
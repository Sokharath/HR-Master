part of 'period_type_bloc.dart';

class PeriodTypeState extends Equatable {
  const PeriodTypeState({required this.currentIndex});

  final int currentIndex;

  @override
  List<Object> get props => [currentIndex];
}

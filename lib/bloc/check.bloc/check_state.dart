part of 'check_bloc.dart';

abstract class CheckState extends Equatable {
  const CheckState();

  @override
  List<Object> get props => [];
}

class CheckInitial extends CheckState {}

class CheckInState extends CheckState {}

class CheckOutState extends CheckState {}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'check_event.dart';
part 'check_state.dart';

class CheckBloc extends Bloc<CheckEvent, CheckState> {
  CheckBloc() : super(CheckInitial()) {
    on<CheckOutEvent>(_onCheckOut);
    on<CheckInEvent>(_onCheckIn);
  }
  void _onCheckOut(CheckOutEvent event, Emitter<CheckState> emit) {
    emit(CheckOutState());
  }

  void _onCheckIn(CheckInEvent event, Emitter<CheckState> emit) {
    emit(CheckInState());
  }
}

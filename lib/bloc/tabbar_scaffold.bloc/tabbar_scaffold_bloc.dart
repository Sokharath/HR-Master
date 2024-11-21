import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tabbar_scaffold_event.dart';
part 'tabbar_scaffold_state.dart';

class TabbarScaffoldBloc
    extends Bloc<TabbarScaffoldEvent, TabbarScaffoldState> {
  TabbarScaffoldBloc() : super(const TabbarScaffoldInitial(0)) {
    on<TabbarScaffoldStarted>(_onTabbarScaffoldStarted);
    on<TabbarScaffoldRequestChanged>(_onTabbarScaffoldRequestedChange);
  }

  void _onTabbarScaffoldStarted(
      TabbarScaffoldStarted event, Emitter<TabbarScaffoldState> emit) {
    emit(TabbarScaffoldState(event.index));
  }

  void _onTabbarScaffoldRequestedChange(
      TabbarScaffoldRequestChanged event, Emitter<TabbarScaffoldState> emit) {
    emit(TabbarScaffoldState(event.index));
  }
}

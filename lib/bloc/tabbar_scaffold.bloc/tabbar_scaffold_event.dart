part of 'tabbar_scaffold_bloc.dart';

class TabbarScaffoldEvent extends Equatable {
  const TabbarScaffoldEvent(this.index);

  final int index;

  @override
  List<Object> get props => [];
}

class TabbarScaffoldStarted extends TabbarScaffoldEvent {
  const TabbarScaffoldStarted(super.index);
}

class TabbarScaffoldRequestChanged extends TabbarScaffoldEvent {
  const TabbarScaffoldRequestChanged(super.index);
}

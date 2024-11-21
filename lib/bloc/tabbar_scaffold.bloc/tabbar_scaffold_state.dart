part of 'tabbar_scaffold_bloc.dart';

 class TabbarScaffoldState extends Equatable {
  const TabbarScaffoldState(this.currentIndex);
  final int currentIndex;

  @override
  List<Object> get props => [currentIndex];
}

final class TabbarScaffoldInitial extends TabbarScaffoldState {
  const TabbarScaffoldInitial(super.currentIndex);
}

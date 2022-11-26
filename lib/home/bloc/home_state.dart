part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState._({
    this.view = HomeView.def
  });

  const HomeState.def() : this._();
  const HomeState.student()
      : this._(view: HomeView.student);
  const HomeState.teacher()
      : this._(view: HomeView.teacher);
  const HomeState.admin()
      : this._(view: HomeView.admin);
  const HomeState.reports()
      : this._(view: HomeView.reports);

  final HomeView view;

  @override
  List<Object> get props => [view];
}

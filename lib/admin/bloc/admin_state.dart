part of 'admin_bloc.dart';

class AdminState extends Equatable {
  const AdminState._({
    this.view = AdminView.def
  });

  const AdminState.def() : this._();
  const AdminState.profile()
      : this._(view: AdminView.profile);
  const AdminState.settings()
      : this._(view: AdminView.settings);
  const AdminState.reports()
      : this._(view: AdminView.reports);
  const AdminState.assets()
      : this._(view: AdminView.assets);

  final AdminView view;

  @override
  List<Object> get props => [view];
}

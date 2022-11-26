import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/admin_repo.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc
    extends Bloc<AdminEvent, AdminState> {
  AdminBloc({
    required AdminRepository adminRepository
  })  : _adminRepository = adminRepository,
        super(const AdminState.def()) {
    on<AdminViewChanged>(_onViewChanged);
    _adminViewSubscription = _adminRepository.status.listen(
          (view) => add(AdminViewChanged(view)),
    );
  }

  final AdminRepository _adminRepository;
  late StreamSubscription<AdminView>
  _adminViewSubscription;

  @override
  Future<void> close() {
    _adminViewSubscription.cancel();
    _adminRepository.dispose();
    return super.close();
  }

  Future<void> _onViewChanged(
      AdminViewChanged event,
      Emitter<AdminState> emit,
      ) async {
    switch (event.view) {
      case AdminView.profile:
        return emit(const AdminState.profile());
      case AdminView.settings:
        return emit(const AdminState.settings());
      case AdminView.reports:
        return emit(const AdminState.reports());
      case AdminView.assets:
        return emit(const AdminState.assets());
    }
  }
}

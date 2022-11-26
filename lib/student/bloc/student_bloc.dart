import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/student_repo.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc
    extends Bloc<StudentEvent, StudentState> {
  StudentBloc({
    required StudentRepository studentRepository
  })  : _studentRepository = studentRepository,
        super(const StudentState.def()) {
    on<StudentViewChanged>(_onViewChanged);
    _studentViewSubscription = _studentRepository.status.listen(
          (view) => add(StudentViewChanged(view)),
    );
  }

  final StudentRepository _studentRepository;
  late StreamSubscription<StudentView>
  _studentViewSubscription;

  @override
  Future<void> close() {
    _studentViewSubscription.cancel();
    _studentRepository.dispose();
    return super.close();
  }

  Future<void> _onViewChanged(
      StudentViewChanged event,
      Emitter<StudentState> emit,
      ) async {
    switch (event.view) {
      case StudentView.profile:
        return emit(const StudentState.profile());
      case StudentView.learner:
        return emit(const StudentState.learner());
      case StudentView.qb:
        return emit(const StudentState.qb());
      case StudentView.assets:
        return emit(const StudentState.assets());
    }
  }
}

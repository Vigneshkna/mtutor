import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repository/teacher_repo.dart';

part 'teacher_event.dart';
part 'teacher_state.dart';

class TeacherBloc
    extends Bloc<TeacherEvent, TeacherState> {
  TeacherBloc({
    required TeacherRepository teacherRepository
  })  : _teacherRepository = teacherRepository,
        super(const TeacherState.def()) {
    on<TeacherViewChanged>(_onViewChanged);
    _teacherViewSubscription = _teacherRepository.status.listen(
          (view) => add(TeacherViewChanged(view)),
    );
  }

  final TeacherRepository _teacherRepository;
  late StreamSubscription<TeacherView>
  _teacherViewSubscription;

  @override
  Future<void> close() {
    _teacherViewSubscription.cancel();
    _teacherRepository.dispose();
    return super.close();
  }

  Future<void> _onViewChanged(
      TeacherViewChanged event,
      Emitter<TeacherState> emit,
      ) async {
    switch (event.view) {
      case TeacherView.profile:
        return emit(const TeacherState.profile());
      case TeacherView.attendance:
        return emit(const TeacherState.attendance());
      case TeacherView.syllabus:
        return emit(const TeacherState.syllabus());
      case TeacherView.assets:
        return emit(const TeacherState.assets());
    }
  }
}

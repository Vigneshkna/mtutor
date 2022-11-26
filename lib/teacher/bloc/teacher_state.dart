part of 'teacher_bloc.dart';

class TeacherState extends Equatable {
  const TeacherState._({
    this.view = TeacherView.def
  });

  const TeacherState.def() : this._();
  const TeacherState.profile()
      : this._(view: TeacherView.profile);
  const TeacherState.attendance()
      : this._(view: TeacherView.attendance);
  const TeacherState.syllabus()
      : this._(view: TeacherView.syllabus);
  const TeacherState.assets()
      : this._(view: TeacherView.assets);

  final TeacherView view;

  @override
  List<Object> get props => [view];
}

part of 'student_bloc.dart';

class StudentState extends Equatable {
  const StudentState._({
    this.view = StudentView.def
  });

  const StudentState.def() : this._();
  const StudentState.profile()
      : this._(view: StudentView.profile);
  const StudentState.learner()
      : this._(view: StudentView.learner);
  const StudentState.qb()
      : this._(view: StudentView.qb);
  const StudentState.assets()
      : this._(view: StudentView.assets);

  final StudentView view;

  @override
  List<Object> get props => [view];
}

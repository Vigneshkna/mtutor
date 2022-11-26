import 'dart:async';

enum StudentView { def, profile, learner, qb, assets }

class StudentRepository {
  final _controller = StreamController<StudentView>();

  Stream<StudentView> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield StudentView.profile;
    yield* _controller.stream;
  }

  void profileOn() {
    _controller.add(StudentView.profile);
  }
  void learnerOn() {
    _controller.add(StudentView.learner);
  }
  void qbOn() {
    _controller.add(StudentView.qb);
  }
  void assetsOn() {
    _controller.add(StudentView.assets);
  }

  void dispose() => _controller.close();
}

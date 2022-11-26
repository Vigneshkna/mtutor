import 'dart:async';

enum HomeView { def, student, teacher, admin, reports }

class HomeRepository {
  final _controller = StreamController<HomeView>();

  Stream<HomeView> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield HomeView.student;
    yield* _controller.stream;
  }

  void studentOn() {
    _controller.add(HomeView.student);
  }
  void teacherOn() {
    _controller.add(HomeView.teacher);
  }
  void adminOn() {
    _controller.add(HomeView.admin);
  }
  void reportsOn() {
    _controller.add(HomeView.reports);
  }

  void dispose() => _controller.close();
}

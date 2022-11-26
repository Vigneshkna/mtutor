import 'dart:async';

enum TeacherView { def, profile, attendance, syllabus, assets }

class TeacherRepository {
  final _controller = StreamController<TeacherView>();

  Stream<TeacherView> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield TeacherView.profile;
    yield* _controller.stream;
  }

  void profileOn() {
    _controller.add(TeacherView.profile);
  }
  void attendanceOn() {
    _controller.add(TeacherView.attendance);
  }
  void syllabusOn() {
    _controller.add(TeacherView.syllabus);
  }
  void assetsOn() {
    _controller.add(TeacherView.assets);
  }

  void dispose() => _controller.close();
}

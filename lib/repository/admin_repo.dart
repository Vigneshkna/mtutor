import 'dart:async';

enum AdminView { def, profile, settings, reports, assets }

class AdminRepository {
  final _controller = StreamController<AdminView>();

  Stream<AdminView> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AdminView.profile;
    yield* _controller.stream;
  }

  void profileOn() {
    _controller.add(AdminView.profile);
  }
  void settingsOn() {
    _controller.add(AdminView.settings);
  }
  void reportsOn() {
    _controller.add(AdminView.reports);
  }
  void assetsOn() {
    _controller.add(AdminView.assets);
  }

  void dispose() => _controller.close();
}

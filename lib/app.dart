import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobiletutor/admin/admin.dart';


import 'home/bloc/home_bloc.dart';
import 'home/view/home_page.dart';
import 'repository/admin_repo.dart';
import 'repository/home_repo.dart';

import 'repository/student_repo.dart';
import 'repository/teacher_repo.dart';
import 'splash/view/splash_page.dart';
import 'student/student.dart';
import 'teacher/teacher.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.homeRepository,
    required this.studentRepository,
    required this.teacherRepository,
    required this.adminRepository,
  });

  final HomeRepository homeRepository;
  final StudentRepository studentRepository;
  final TeacherRepository teacherRepository;
  final AdminRepository adminRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: homeRepository,
      child: BlocProvider(
        create: (_) => HomeBloc(homeRepository: homeRepository),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            switch (state.view) {
              case HomeView.student:
                _navigator.pushAndRemoveUntil<void>(
                  StudentPage.route(),
                      (route) => false,
                );
                break;
              case HomeView.teacher:
                _navigator.pushAndRemoveUntil<void>(
                  TeacherPage.route(),
                      (route) => false,
                );
                break;
              case HomeView.admin:
                _navigator.pushAndRemoveUntil<void>(
                  AdminPage.route(),
                      (route) => false,
                );
                break;
              // case HomeView.reports:
              //   _navigator.pushAndRemoveUntil<void>(
              //     ReportPage.route(),
              //         (route) => false,
              //   );
              //   break;
              case HomeView.def:
                _navigator.pushAndRemoveUntil<void>(
                  HomePage.route(),
                      (route) => false,
                );
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}

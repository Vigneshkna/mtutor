// import 'package:flutter/material.dart';
// import 'package:mobiletutor/repository/student_repo.dart';
//
// import 'app.dart';
// import 'repository/admin_repo.dart';
// import 'repository/home_repo.dart';
// import 'repository/teacher_repo.dart';
//
// void main() {
//   runApp(
//     App(
//       homeRepository: HomeRepository(),
//       studentRepository: StudentRepository(),
//       teacherRepository: TeacherRepository(),
//       adminRepository: AdminRepository(),
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiletutor/profile/view/profile_page.dart';


import 'attendance/view/attendance_page.dart';
import 'package:mobiletutor/learn/learn.dart';
import 'questionbank/view/qb_page.dart';
import 'report/view/reports_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReportsPage(),//QbPage(),
    );
  }
}


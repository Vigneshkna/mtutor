import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../components/tilecard.dart';
import '../../repository/student_repo.dart';
import '../bloc/student_bloc.dart';


class StudentPage extends StatelessWidget {
  const StudentPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const StudentPage());
  }

  @override
  Widget build(BuildContext context) {

   return Scaffold(
  backgroundColor: Colors.orangeAccent[50],
  appBar: AppBar(title: const Text('Student Dashboard')),
  body:  Center(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Align(
            alignment: const Alignment(0, -1 / 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(padding: EdgeInsets.all(12)),
                Builder(
                  builder: (context) {
                    final view = context.select(
                          (StudentBloc bloc) => bloc.state.view.name,
                    );
                    if (view == 'def') {
                      return GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        padding: const EdgeInsets.all(10.0),
                        children: List.generate(
                          StudentView.values.length,
                              (index) => TileCard(title:StudentView.values[index+1].name,
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                const Padding(padding: EdgeInsets.all(12)),
              ],
            ),
          ),
        ),
      ),

);
  }
}

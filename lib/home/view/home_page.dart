import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobiletutor/home/bloc/home_bloc.dart';

import '../../components/tilecard.dart';
import '../../repository/home_repo.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.orangeAccent[50],
      appBar: AppBar(title: const Text('Home Dashboard')),
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
                          (HomeBloc bloc) => bloc.state.view.name,
                    );
                    if (view == 'def') {
                      return GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        padding: const EdgeInsets.all(10.0),
                        children: List.generate(
                          HomeView.values.length,
                              (index) => TileCard(title:HomeView.values[index+1].name,
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

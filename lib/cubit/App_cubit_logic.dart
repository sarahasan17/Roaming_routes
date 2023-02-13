import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelling_app/cubit/app_cubits.dart';
import 'package:travelling_app/navigation_page/detail_page.dart';
import 'package:travelling_app/navigation_page/main_page.dart';
import 'package:travelling_app/pages/welcome_page.dart';

import 'app_cubit_state.dart';

class AppCubitlogic extends StatefulWidget {
  const AppCubitlogic({Key? key}) : super(key: key);

  @override
  State<AppCubitlogic> createState() => _AppCubitlogicState();
}

class _AppCubitlogicState extends State<AppCubitlogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppCubits, Cubitstate>(
      builder: (context, state) {
        if (state is WelcomeState) {
          return const Welcome_page();
        }
        if (state is LoadedState) {
          return const Mainpage();
        }
        if (state is DetailState) {
          return const Detailpage();
        }
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container();
        }
      },
    ));
  }
}

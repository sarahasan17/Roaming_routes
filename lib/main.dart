import 'package:flutter/material.dart';
import 'package:travelling_app/cubit/App_cubit_logic.dart';
import 'package:travelling_app/services/data_services.dart';
import 'pages/welcome_page.dart';
import 'navigation_page/main_page.dart';
import 'navigation_page/detail_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/app_cubits.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<AppCubits>(
          create: (context) => AppCubits(data: Dataservices()),
          child: AppCubitlogic()),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvc_app/constants/routes.dart';
import 'package:mvc_app/controllers/auth_controller.dart';
import 'package:mvc_app/setup.dart';
import 'package:mvc_app/views/home_view.dart';
import 'package:mvc_app/views/loading_view.dart';
import 'package:mvc_app/views/log_in_view.dart';

/// The main function in Dart sets up a Flutter application with error handling using runZonedGuarded.
void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await setup();

      runApp(MyApp());
    },
    (_, __) {},
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AuthController _authController = AuthController();


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MVC APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightGreenAccent,
        ),
        useMaterial3: true,
      ),
      home: StreamBuilder(
        stream: _authController.user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return HomeView();
            } else {
              return const LoginView();
            }
          } else {
            return const LoadingView();
          }
        },
      ),
      routes: {
        AppRoutes.login: (_) => const LoginView(),
        AppRoutes.home: (_) => HomeView(),
      },
    );
  }
}

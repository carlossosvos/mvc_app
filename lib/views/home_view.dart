import 'package:flutter/material.dart';
import 'package:mvc_app/constants/routes.dart';
import '../controllers/auth_controller.dart';

class HomeView extends StatelessWidget {
  final AuthController _authController = AuthController();

  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await _authController.signOut();
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.login,
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: const Text('Welcome to Home!'),
      ),
    );
  }
}

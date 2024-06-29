import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final AuthController _authController = AuthController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                dynamic result =
                    await _authController.signInWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
                
                if (result == null) {
                  print('Sign in failed');
                } else {
                  Navigator.pushReplacementNamed(
                    context,
                    '/home',
                  );
                }
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () async {
                final result =
                    await _authController.registerWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
                if (result == null) {
                  print('Registration failed');
                } else {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

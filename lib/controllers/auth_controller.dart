import '../services/auth_service.dart';
import '../models/user_model.dart';

// La clase AuthController consume los metodos de AuthService.
class AuthController {
  final AuthService _authService = AuthService();

  Stream<UserModel?> get user => _authService.user;

  Future<UserModel?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _authService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserModel?> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _authService.registerWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() {
    return _authService.signOut();
  }
}

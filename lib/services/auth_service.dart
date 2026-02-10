import 'dart:math';

class AuthService {
  static final Map<String, String> _codes = {};

  // Login
  Future<bool> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return email.isNotEmpty && password.isNotEmpty;
  }

  // Register
  Future<bool> register(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return true;
  }

  // Send reset code
  Future<void> sendResetCode(String email) async {
    final code = (100000 + Random().nextInt(900000)).toString();
    _codes[email] = code;

    // Simulation d'envoi email
    print('Code envoyé à $email : $code');
  }

  // Verify code
  bool verifyCode(String email, String code) {
    return _codes[email] == code;
  }

  Future<void> resetPassword(String email, String newPassword) async {
  await Future.delayed(const Duration(seconds: 1));
  // Simulation succès
}

}
import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthController {
  final AuthService _service = AuthService();

  Future<void> login(BuildContext context, String email, String password) async {
    final success = await _service.login(email, password);
    if (success) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  Future<void> registerFull(
  BuildContext context, {
  required String nom,
  required String prenom,
  required String email,
  required String telephone,
  required String profil,
  required String formation,
  required String niveau,
  required String password,
}) async {
  await _service.register(email, password);
  Navigator.pop(context);
}


  Future<void> forgotPassword(BuildContext context, String email) async {
    await _service.sendResetCode(email);
    Navigator.pushNamed(context, '/verify-code', arguments: email);
  }

  Future<void> resetPassword(
  BuildContext context,
  String email,
  String newPassword,
) async {
  await _service.resetPassword(email, newPassword);

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Mot de passe modifié')),
  );

  Navigator.pushNamedAndRemoveUntil(
    context,
    '/login',
    (route) => false,
  );
}


  bool verifyCode(String email, String code) {
    return _service.verifyCode(email, code);
  }
}

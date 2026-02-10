import 'package:flutter/material.dart';
import '../../controllers/auth_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final _passwordCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();
  final AuthController _controller = AuthController();

  @override
  Widget build(BuildContext context) {
    final String email =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text('Nouveau mot de passe')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Compte : $email'),
            const SizedBox(height: 16),

            TextField(
              controller: _passwordCtrl,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Nouveau mot de passe',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: _confirmCtrl,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirmer mot de passe',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                if (_passwordCtrl.text != _confirmCtrl.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('Les mots de passe ne correspondent pas'),
                    ),
                  );
                  return;
                }

                _controller.resetPassword(
                  context,
                  email,
                  _passwordCtrl.text,
                );
              },
              child: const Text('Changer le mot de passe'),
            ),
          ],
        ),
      ),
    );
  }
}

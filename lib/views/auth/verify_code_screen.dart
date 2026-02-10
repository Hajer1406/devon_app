import 'package:flutter/material.dart';
import '../../controllers/auth_controller.dart';

class VerifyCodeScreen extends StatelessWidget {
  VerifyCodeScreen({super.key});

  final _codeCtrl = TextEditingController();
  final AuthController _controller = AuthController();

  @override
  Widget build(BuildContext context) {
    final String email =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text('Vérification du code')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Un code a été envoyé à :\n$email',
                textAlign: TextAlign.center),
            const SizedBox(height: 16),

            TextField(
              controller: _codeCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Code reçu',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                final ok =
                    _controller.verifyCode(email, _codeCtrl.text);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        ok ? 'Code valide' : 'Code incorrect'),
                  ),
                );

                if (ok) {
  Navigator.pushReplacementNamed(
    context,
    '/reset-password',
    arguments: email,
  );
}

              },
              child: const Text('Vérifier'),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../controllers/auth_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController _controller = AuthController();

  final _nomCtrl = TextEditingController();
  final _prenomCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _telCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmPasswordCtrl = TextEditingController();

  String _profil = 'Apprenant';
  String _formation = 'Développement Mobile';
  String _niveau = 'Débutant';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscription – Devon'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _input(_nomCtrl, 'Nom', Icons.person),
            _input(_prenomCtrl, 'Prénom', Icons.person_outline),
            _input(_emailCtrl, 'Email', Icons.email,
                type: TextInputType.emailAddress),
            _input(_telCtrl, 'Téléphone', Icons.phone,
                type: TextInputType.phone),

            const SizedBox(height: 16),

            _dropdown(
              label: 'Profil',
              value: _profil,
              items: ['Apprenant', 'Formateur'],
              onChanged: (v) => setState(() => _profil = v!),
            ),

            _dropdown(
              label: 'Formation',
              value: _formation,
              items: [
                'Développement Mobile',
                'Développement Web',
                'UI / UX Design',
                'Data & IA'
              ],
              onChanged: (v) => setState(() => _formation = v!),
            ),

            _dropdown(
              label: 'Niveau',
              value: _niveau,
              items: ['Débutant', 'Intermédiaire', 'Avancé'],
              onChanged: (v) => setState(() => _niveau = v!),
            ),

            const SizedBox(height: 16),

            _input(_passwordCtrl, 'Mot de passe', Icons.lock,
                obscure: true),
            _input(_confirmPasswordCtrl, 'Confirmer mot de passe',
                Icons.lock_outline,
                obscure: true),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _register,
                child: const Text('Créer le compte'),
              ),
            ),

            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Déjà inscrit ? Se connecter'),
            ),
          ],
        ),
      ),
    );
  }
}

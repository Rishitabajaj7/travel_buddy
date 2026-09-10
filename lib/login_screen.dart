import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _login() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute<void>(
        builder: (_) => HomeScreen(username: _nameController.text.trim()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton()),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(22, 10, 22, 24),
          children: [
            Text(
              'Welcome back',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Tell us who is travelling with us today.',
              style: TextStyle(color: Colors.black54, fontSize: 12),
            ),
            const SizedBox(height: 30),
            _label('Your name'),
            _field(
              _nameController,
              'Vanessa',
              Icons.person_outline,
              (value) => value == null || value.trim().isEmpty
                  ? 'Please enter your name'
                  : null,
            ),
            const SizedBox(height: 16),
            _label('Email address'),
            _field(
              _emailController,
              'you@example.com',
              Icons.mail_outline,
              (value) => value == null || !value.contains('@')
                  ? 'Please enter a valid email'
                  : null,
            ),
            const SizedBox(height: 26),
            appButton(context, 'Continue', onPressed: _login),
          ],
        ),
      ),
    );
  }

  Widget _label(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
      ),
    );
  }

  Widget _field(
    TextEditingController controller,
    String hint,
    IconData icon,
    String? Function(String?) validator,
  ) {
    return TextFormField(
      controller: controller,
      validator: validator,
      style: const TextStyle(fontSize: 12),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 12, color: Colors.black45),
        prefixIcon: Icon(icon, size: 19),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

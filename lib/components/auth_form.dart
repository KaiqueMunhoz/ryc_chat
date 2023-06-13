import 'package:flutter/material.dart';
import 'package:ryc_chat/models/auth_form_data.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = AuthFormData();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-mail'),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Senha'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  _formData.isLogin ? 'Entrar' : 'Cadastrar',
                ),
              ),
              TextButton(
                child: Text(
                  _formData.isLogin
                      ? 'Criar uma nova conta?'
                      : 'Já possui conta?',
                ),
                onPressed: () {
                  setState(() {
                    _formData.toggleAuthMode();
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form(
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
          ],
        ),
      ),
    );
  }
}

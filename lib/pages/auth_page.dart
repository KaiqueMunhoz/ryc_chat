import 'package:flutter/material.dart';
import 'package:ryc_chat/components/auth_form.dart';
import 'package:ryc_chat/models/auth_form_data.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  void _handleSubmit(AuthFormData formData) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: AuthForm(
            onSubmit: _handleSubmit,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ryc_chat/components/auth_form.dart';
import 'package:ryc_chat/core/models/auth_form_data.dart';
import 'package:ryc_chat/core/services/auth/auth_mock_service.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool _isLoading = false;

  Future<void> _handleSubmit(AuthFormData formData) async {
    try {
      setState(() => _isLoading = true);
      if (formData.isLogin) {
        await AuthMockService().login(
          email: formData.email,
          password: formData.password,
        );
      } else {
        await AuthMockService()
            .signup(
          name: formData.name,
          email: formData.email,
          password: formData.password,
          image: formData.image
        );
      }
    } catch (error) {} finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: AuthForm(
                onSubmit: _handleSubmit,
              ),
            ),
          ),
          if (_isLoading)
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.5),
              ),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )
        ],
      ),
    );
  }
}

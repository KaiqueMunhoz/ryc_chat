import 'package:flutter/material.dart';
import 'package:ryc_chat/core/services/auth/auth_service.dart';
import 'package:ryc_chat/pages/auth_page.dart';
import 'package:ryc_chat/pages/chat_page.dart';
import 'package:ryc_chat/pages/loading_page.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userChanges,
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        }
        return snapshot.hasData ? ChatPage() : AuthPage();
      },
    );
  }
}

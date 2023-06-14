import 'package:flutter/material.dart';
import 'package:ryc_chat/core/services/auth/auth_mock_service.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                AuthMockService().logout();
              },
            )
          ],
        ),
      ),
    );
  }
}

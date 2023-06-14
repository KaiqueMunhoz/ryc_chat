import 'package:flutter/material.dart';
import 'package:ryc_chat/components/messages.dart';
import 'package:ryc_chat/core/services/auth/auth_service.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cod3r Chat'),
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Theme.of(context).primaryIconTheme.color,
            ),
            items: [],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Messages(),
            ),
          ],
        ),
      ),
    );
  }
}

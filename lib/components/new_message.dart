import 'package:flutter/material.dart';
import 'package:ryc_chat/core/services/auth/auth_service.dart';
import 'package:ryc_chat/core/services/chat/chat_service.dart';

class NewMessage extends StatelessWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _enteredMessage = '';

    Future<void> _sendMessage() async {
      final user = AuthService().currentUser;

      if (user != null) {
        await ChatService().save(text: _enteredMessage, user: user);
      }
    }

    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(labelText: 'Enviar mensagem'),
          ),
        ),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
        ),
      ],
    );
  }
}

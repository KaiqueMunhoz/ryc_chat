import 'package:flutter/material.dart';
import 'package:ryc_chat/core/services/auth/auth_service.dart';
import 'package:ryc_chat/core/services/chat/chat_service.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _messageController = TextEditingController();
  String _message = '';

  Future<void> _sendMessage() async {
    final user = AuthService().currentUser;

    if (user != null) {
      await ChatService().save(text: _message, user: user);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(labelText: 'Enviar mensagem'),
            controller: _messageController,
            onChanged: (msg) => setState(() => _message = msg),
            onSubmitted: (_) {
              if (_message.trim().isNotEmpty) {
                _sendMessage();
              }
            },
          ),
        ),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: _message.trim().isEmpty ? null : _sendMessage,
        ),
      ],
    );
  }
}

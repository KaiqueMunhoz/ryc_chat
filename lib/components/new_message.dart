import 'package:flutter/material.dart';

class NewMessage extends StatelessWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _enteredMessage = '';

    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(labelText: 'Enviar mensagem'),
          ),
        ),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: _enteredMessage.trim().isEmpty ? null : () {},
        ),
      ],
    );
  }
}

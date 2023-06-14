import 'package:flutter/material.dart';
import 'package:ryc_chat/core/services/chat/chat_mock_service.dart';
import 'package:ryc_chat/core/services/chat/chat_service.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ChatService().messagesStream(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData) {
          return Center(
            child: Text('Sem Dados. Vamos conversar?'),
          );
        }
      },
    );
  }
}

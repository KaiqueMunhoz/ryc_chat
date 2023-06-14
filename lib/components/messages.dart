import 'package:flutter/material.dart';
import 'package:ryc_chat/components/messages_bubble.dart';
import 'package:ryc_chat/core/models/chat_message.dart';
import 'package:ryc_chat/core/services/auth/auth_service.dart';
import 'package:ryc_chat/core/services/chat/chat_service.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthService().currentUser;

    return StreamBuilder<List<ChatMessage>>(
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
        } else {
          final msgs = snapshot.data!;
          return ListView.builder(
            reverse: true,
            itemCount: msgs.length,
            itemBuilder: (_, index) {
              final _message = msgs[index];
              final bool _isCurrentUser = currentUser?.id == _message.id;

              return MessagesBubble(
                key: ValueKey(_message.id),
                message: _message,
                belongsToCurrentUser: _isCurrentUser,
              );
            },
          );
        }
      },
    );
  }
}

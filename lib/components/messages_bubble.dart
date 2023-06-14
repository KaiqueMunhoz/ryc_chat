import 'package:flutter/material.dart';
import 'package:ryc_chat/core/models/chat_message.dart';

class MessagesBubble extends StatelessWidget {
  final ChatMessage message;
  final bool belongsToCurrentUser;

  const MessagesBubble({
    Key? key,
    required this.message,
    required this.belongsToCurrentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: belongsToCurrentUser
            ? Colors.grey.shade300
            : Theme.of(context).accentColor,
      ),
      child: Text(message.text),
    );
  }
}

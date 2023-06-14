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
    return Text(message.text);
  }
}

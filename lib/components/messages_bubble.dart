import 'package:flutter/material.dart';
import 'package:ryc_chat/core/models/chat_message.dart';

class MessagesBubble extends StatelessWidget {
  final ChatMessage message;

  const MessagesBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

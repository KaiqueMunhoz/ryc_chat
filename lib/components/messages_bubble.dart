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
    return Row(
      mainAxisAlignment: belongsToCurrentUser
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: belongsToCurrentUser
                ? Colors.grey.shade300
                : Theme.of(context).accentColor,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          width: 180,
          child: Column(
            children: [
              Text(
                message.userName,
                style: TextStyle(
                  color: belongsToCurrentUser ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                message.text,
                style: TextStyle(
                  color: belongsToCurrentUser ? Colors.black : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

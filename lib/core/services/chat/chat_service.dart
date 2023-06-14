import 'package:ryc_chat/core/models/chat_message.dart';
import 'package:ryc_chat/core/models/chat_user.dart';

abstract class ChatService {
  Future<ChatMessage> save({
    required String text,
    required ChatUser user,
  });
}

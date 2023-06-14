import 'package:ryc_chat/core/models/chat_message.dart';
import 'package:ryc_chat/core/models/chat_user.dart';

abstract class ChatService {
  Stream<List<ChatMessage>> messagesStream();

  Future<ChatMessage> save({
    required String text,
    required ChatUser user,
  });
}

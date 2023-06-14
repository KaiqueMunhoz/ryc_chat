import 'package:ryc_chat/core/models/chat_message.dart';
import 'package:ryc_chat/core/models/chat_user.dart';
import 'package:ryc_chat/core/services/chat/chat_mock_service.dart';

abstract class ChatService {
  Stream<List<ChatMessage>> messagesStream();

  Future<ChatMessage> save({
    required String text,
    required ChatUser user,
  });

  factory ChatService() {
    return ChatMockService();
  }
}

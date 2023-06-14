import 'package:ryc_chat/core/models/chat_user.dart';
import 'package:ryc_chat/core/models/chat_message.dart';
import 'package:ryc_chat/core/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [];
  @override
  Stream<List<ChatMessage>> messagesStream() {
    throw UnimplementedError();
  }

  @override
  Future<ChatMessage> save({required String text, required ChatUser user}) {
    throw UnimplementedError();
  }
}

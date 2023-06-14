import 'dart:async';

import 'package:ryc_chat/core/models/chat_user.dart';
import 'package:ryc_chat/core/models/chat_message.dart';
import 'package:ryc_chat/core/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgsStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
  });

  @override
  Stream<List<ChatMessage>> messagesStream() {
    return _msgsStream;
  }

  @override
  Future<ChatMessage> save({required String text, required ChatUser user}) {
    throw UnimplementedError();
  }
}

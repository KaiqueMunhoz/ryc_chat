import 'dart:async';
import 'dart:math';

import 'package:ryc_chat/core/models/chat_user.dart';
import 'package:ryc_chat/core/models/chat_message.dart';
import 'package:ryc_chat/core/services/chat/chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [
    ChatMessage(
      id: '1',
      text: 'Bom dia',
      createdAt: DateTime.now(),
      userId: '123',
      userName: 'Bia',
      userImageURL: '',
    ),
    ChatMessage(
      id: '2',
      text: 'Bom dia. Teremos reunião hoje?',
      createdAt: DateTime.now(),
      userId: '456',
      userName: 'Ana',
      userImageURL: 'assets/images/avatar.png',
    ),
    ChatMessage(
      id: '1',
      text: 'Sim. Pode ser agora?',
      createdAt: DateTime.now(),
      userId: '123',
      userName: 'Bia',
      userImageURL: '',
    ),
  ];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgsStream = Stream<List<ChatMessage>>.multi((controller) {
    _controller = controller;
    controller.add(_msgs);
  });

  @override
  Stream<List<ChatMessage>> messagesStream() {
    return _msgsStream;
  }

  @override
  Future<ChatMessage> save({
    required String text,
    required ChatUser user,
  }) async {
    final newMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageURL: user.imageURL,
    );

    _msgs.add(newMessage);
    _controller?.add(_msgs);

    return newMessage;
  }
}

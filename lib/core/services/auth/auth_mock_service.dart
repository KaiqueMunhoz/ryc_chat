import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:ryc_chat/core/models/chat_user.dart';
import 'package:ryc_chat/core/services/auth/auth_service.dart';

class AuthMockService implements AuthService {
  static final _defaultUser = ChatUser(
    id: '1',
    name: 'Teste',
    email: 'teste@',
    imageURL: 'assets/images/avatar.png',
  );

  static Map<String, ChatUser> _users = {};
  static ChatUser? _currentUser;
  static MultiStreamController<ChatUser?>? _controller;
  static final _userStream = Stream<ChatUser?>.multi((controller) {
    _controller = controller;
    _updateUser(_defaultUser);
  });

  @override
  ChatUser? get currentUser {
    return _currentUser;
  }

  @override
  Future<void> login({required String email, required String password}) async {
    _updateUser(_users[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(null);
  }

  @override
  Future<void> signup({
    required String name,
    required String email,
    required String password,
    File? image,
  }) async {
    final newUser = ChatUser(
      id: Random().nextDouble().toString(),
      name: name,
      email: email,
      imageURL: image?.path ?? 'assets/images/avatar.png',
    );

    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  @override
  Stream<ChatUser?> get userChanges {
    return _userStream;
  }

  static void _updateUser(ChatUser? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}

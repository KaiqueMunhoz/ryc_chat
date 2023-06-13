import 'dart:io';

import 'package:ryc_chat/core/models/chat_user.dart';

abstract class AuthService {
  ChatUser? get currentUser;

  Stream<ChatUser?> get userChanges;

  Future<void> signup({
    required String nome,
    required String email,
    required String password,
    required File image,
  });

  Future<void> login({
    required String email,
    required String password,
  });

  Future<void> logout();
}

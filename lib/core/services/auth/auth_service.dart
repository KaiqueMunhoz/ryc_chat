import 'dart:io';

import 'package:ryc_chat/core/models/chat_user.dart';

abstract class AuthService {
  ChatUser? get currentUser;

  Stream<ChatUser?> get userChanges;

  Future<void> signup({
    required String name,
    required String email,
    required String password,
    File? image,
  });

  Future<void> login({
    required String email,
    required String password,
  });

  Future<void> logout();
}

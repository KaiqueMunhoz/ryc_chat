import 'dart:io';

import 'package:ryc_chat/core/models/chat_user.dart';
import 'package:ryc_chat/core/services/auth/auth_service.dart';

class AuthMockService implements AuthService {
  static Map<String, ChatUser> _users = {};
  static ChatUser? _currentUser;

  @override
  // TODO: implement currentUser
  ChatUser? get currentUser => throw UnimplementedError();

  @override
  Future<void> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> signup(
      {required String nome,
      required String email,
      required String password,
      required File image}) {
    // TODO: implement signup
    throw UnimplementedError();
  }

  @override
  // TODO: implement userChanges
  Stream<ChatUser?> get userChanges => throw UnimplementedError();
}

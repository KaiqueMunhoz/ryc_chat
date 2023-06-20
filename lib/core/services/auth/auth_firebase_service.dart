import 'dart:async';
import 'dart:io';

import 'package:ryc_chat/core/models/chat_user.dart';
import 'package:ryc_chat/core/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseService implements AuthService {
  static ChatUser? _currentUser;
  static MultiStreamController<ChatUser?>? _controller;
  static final _userStream = Stream<ChatUser?>.multi((controller) {
    _controller = controller;
  });

  @override
  ChatUser? get currentUser {
    return _currentUser;
  }

  @override
  Future<void> login({required String email, required String password}) async {}

  @override
  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> signup({
    required String name,
    required String email,
    required String password,
    File? image,
  }) async {}

  @override
  Stream<ChatUser?> get userChanges {
    return _userStream;
  }
}

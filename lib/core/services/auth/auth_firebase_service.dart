import 'dart:async';
import 'dart:io';

import 'package:ryc_chat/core/models/chat_user.dart';
import 'package:ryc_chat/core/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseService implements AuthService {
  static ChatUser? _currentUser;
  static final _userStream = Stream<ChatUser?>.multi((controller) async {
    final authChanges = FirebaseAuth.instance.authStateChanges();
    await for (final user in authChanges) {
      _currentUser = user == null ? null : _toChatUser(user);
      controller.add(_currentUser);
    }
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
  }) async {
    final auth = FirebaseAuth.instance;
    final UserCredential credentials = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (credentials.user == null) {
      return;
    }

    credentials.user?.updateDisplayName(name);
  }

  @override
  Stream<ChatUser?> get userChanges {
    return _userStream;
  }

  static ChatUser _toChatUser(User user) {
    return ChatUser(
      id: user.uid,
      name: user.displayName ?? user.email!.split('@')[0],
      email: user.email!,
      imageURL: user.photoURL ?? 'assets/images/avatar.png',
    );
  }
}

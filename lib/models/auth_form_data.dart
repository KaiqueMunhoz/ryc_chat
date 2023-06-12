import 'dart:io';

enum AuthMode { login, signup }

class AuthFormData {
  String name = '';
  String email = '';
  String password = '';
  File? image;
}

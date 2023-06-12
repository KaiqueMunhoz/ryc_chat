import 'dart:io';

enum AuthMode { Login, Signup }

class AuthFormData {
  String name = '';
  String email = '';
  String password = '';
  File? image;
}

// ignore_for_file: public_member_api_docs

import 'package:jwt/user.dart';

/// Static Authenticator class containing predefined users

class Authenticator {
  static const _users = {
    'john': User(id: '1', name: 'John', password: '123'),
    'jack': User(id: '1', name: 'Jack', password: '123'),
  };

  static const _passwords = {
    // ⚠️ Never store user's password in plain text
    // just for the sake of the tutorial.
    'john': '123',
    'jack': '321',
  };

  /// Method to authenticate a user
  User? findByUsernameAndPassword({
    required String username,
    required String password,
  }) {
    final user = _users[username];
    if (user != null && _passwords[username] == password) {
      return user;
    }
    return null;
  }

  User? findByUser({required String name}) {
    return _users[name];
  }

  ///
  Future<User?> verifyToken(String username) async {
    if (_users[username] != null) {
      return _users[username];
    }

    return null;
  }
}

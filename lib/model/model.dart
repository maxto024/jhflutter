import 'package:flutter/foundation.dart';

class User {
  final String username;
  final String password;
  final bool rememberMe;
  User({this.username, this.password, this.rememberMe});
  User copyWith({String username, String password, bool rememberMe}) {
    return User(
        username: username ?? this.username,
        password: password ?? this.password,
        rememberMe: rememberMe ?? this.rememberMe);
  }

  User.fromJson(Map json)
      : username = json['username'],
        password = json['password'],
        rememberMe = json['password'];

  Map toJson() => {
        'username': username,
        'password': password,
        'rememberMe': rememberMe,
      };
}

class AuthKey {
  final String authkey;
  AuthKey({this.authkey});
  AuthKey copyWith({String authKey}) {
    return AuthKey(authkey: authKey ?? this.authkey);
  }
}

class AppState {
  final User user;
  final AuthKey authKey;

  const AppState({
    this.user,
    this.authKey,
  });

  factory AppState.initialState() => AppState(
      user: User(username: '', password: '', rememberMe: false),
      authKey: AuthKey(authkey: ''));
}

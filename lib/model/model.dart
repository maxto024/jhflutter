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
  @override
  String toString() {
    return toJson().toString();
  }
}

class Auth {
  final String authkey;
  Auth({this.authkey});
  Auth copyWith({String authKey}) {
    return Auth(authkey: authKey ?? this.authkey);
  }

  Auth.fromJson(Map json) : authkey = json['id_token'];
  Map toJson() => {
        'id_token': authkey,
      };
  @override
  String toString() {
    return toJson().toString();
  }
}

class AppState {
  final User user;
  final Auth auth;

  const AppState({
    this.user,
    this.auth,
  });

  factory AppState.initialState() => AppState(
      user: User(username: '', password: '', rememberMe: false),
      auth: Auth(authkey: ''));

  @override
  String toString() {
    return user.toJson().toString() + '\n' + auth.toJson().toString();
  }
}

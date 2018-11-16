import 'dart:async';
import 'dart:convert';

import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'package:jhflutter/model/model.dart';
import 'package:jhflutter/redux/actions.dart';

var url = "http://example.com/whatsit/create";

List<Middleware<AppState>> appStateMiddleware([
  AppState state = const AppState(),
]) {
  final login = _login(state);
  final logout = _logout(state);
  return [
    TypedMiddleware<AppState, LoginAction>(login),
    TypedMiddleware<AppState, LogoutAction>(logout),
  ];
}

Middleware<AppState> _login(AppState state) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);
    var authkey = loginApi(store.state);
    store.dispatch(LoginSuccessAction(AuthKey(authkey: authkey.toString())));
  };
}

Middleware<AppState> _logout(AppState state) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    store.dispatch(LoginSuccessAction(state.authKey));
  };
}

void saveToPrefs(AppState state) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  // var string = json.encode(state.toJson());
  //await preferences.setString('itemsState', string);
}

Future<String> loginApi(AppState state) async {
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  //var string = preferences.getString('itemsState');

  var url = "https://somaliapp.com:8080/api/authenticate";
  var body = json.encode(state.user.toJson());
  print(body);
  final response = await http.post(Uri.encodeFull(url), body: body, headers: {
    "Accept": "application/json",
    "Content-Type": "application/json"
  });
  print('response: ${response.body}');

  if (response.body != null) {
    var json = jsonDecode(response.body);
    return response.body;
  }
  return '';
}

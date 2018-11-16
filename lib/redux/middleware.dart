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
    print('war hayaaay bacaac');
    print(store.state.user.password);
    loginApi(store.state);
    store.dispatch(LoginSuccessAction(AuthKey(authkey: 'wakas')));
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

Future<AppState> loginApi(AppState state) async {
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  //var string = preferences.getString('itemsState');

  var url = "https://somaliapp.com:8080/api/authenticate";
  var body = json.encode(state.user.toJson());
  print(body);
  await http.post(Uri.encodeFull(url), body: body, headers: {
    "Accept": "application/json",
    "Content-Type": "application/json"
  }).then((response) {
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
  });
  // if (string != null) {
  //   Map map = json.decode(string);
  // //  return AppState.fromJson(map);
  // }
  return AppState.initialState();
}

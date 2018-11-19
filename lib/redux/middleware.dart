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
  final loadAuth = _getAuthFromPrefs(state);
  final login = _login(state);
  final logout = _logout(state);
  return [
    TypedMiddleware<AppState, LoginAction>(login),
    TypedMiddleware<AppState, LogoutAction>(logout),
    TypedMiddleware<AppState, GetAuthAction>(loadAuth),
  ];
}

Middleware<AppState> _login(AppState state) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);
    loginApi(store.state).then((res) {
      store.dispatch(LoginSuccessAction(res));
      _saveAuthToPrefrences(res);
    });
  };
}

Middleware<AppState> _logout(AppState state) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);
    _deleteAuthPrefrences();
    store.dispatch(LogoutSuccessAction(Auth(authkey: null)));
  };
}

Middleware<AppState> _getAuthFromPrefs(AppState state) {
  return (Store<AppState> store, action, NextDispatcher next) {
    next(action);

    _loadAuthFromPrefs().then((state) {
      store.dispatch(LoadedAuthAction(state));
      print('authkeyfromStored:${state.authkey}');
    });
  };
}

Future<Auth> loginApi(AppState state) async {
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
  var res = Auth.fromJson(jsonDecode(response.body));
  print(res.authkey);
  return res;
}

void _saveAuthToPrefrences(Auth auth) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var string = json.encode(auth.toJson());
  await preferences.setString('auth', string);
}

void _deleteAuthPrefrences() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.remove('auth');
}

Future<Auth> _loadAuthFromPrefs() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var string = preferences.getString('auth');
  if (string != null) {
    Map map = json.decode(string);
    print(Auth.fromJson(map).authkey);
    return Auth.fromJson(map);
  }

  return Auth(authkey: null);
}

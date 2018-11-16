import 'package:jhflutter/model/model.dart';
import 'package:jhflutter/redux/actions.dart';

import 'package:redux/redux.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    user: userReducer(state.user, action),
    authKey: authReducer(state.authKey, action)
  );
}

Reducer<User> userReducer = combineReducers<User>([
  TypedReducer<User, LoginAction>(loginReducer),
]);

Reducer<AuthKey> authReducer = combineReducers<AuthKey>([
  TypedReducer<AuthKey, LoginSuccessAction>(loginSuccess),
  TypedReducer<AuthKey, LogoutAction>(logoutReducer),
]);

User loginReducer(User user, LoginAction action) {
  print('maxa jira');
  return  User(username: action.user.username, password: action.user.password, rememberMe: action.user.rememberMe);
}

AuthKey loginSuccess(AuthKey items, LoginSuccessAction action) {
  return AuthKey(authkey: action.authKey.authkey);
}

AuthKey logoutReducer(AuthKey authkey, LogoutAction action) {
  return  AuthKey(authkey: '');
}


import 'package:jhflutter/model/model.dart';
import 'package:jhflutter/redux/actions.dart';

import 'package:redux/redux.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    user: userReducer(state.user, action),
    auth: authReducer(state.auth, action)
  );
}

Reducer<User> userReducer = combineReducers<User>([
  TypedReducer<User, LoginAction>(loginReducer),
]);

Reducer<Auth> authReducer = combineReducers<Auth>([
  TypedReducer<Auth, LoginSuccessAction>(loginSuccess),
  TypedReducer<Auth, LogoutAction>(logoutReducer),
    TypedReducer<Auth, LoadedAuthAction>(lodedAuthReducer),
]);

User loginReducer(User user, LoginAction action) {
  print('maxa jira');
  return  User(username: action.user.username, password: action.user.password, rememberMe: action.user.rememberMe);
}

Auth loginSuccess(Auth auth, LoginSuccessAction action) {
  return Auth(authkey: action.authKey.authkey);
}

Auth lodedAuthReducer(Auth auth , LoadedAuthAction action){
  return action.auth;
}

Auth logoutReducer(Auth authkey, LogoutAction action) {
  return  Auth(authkey: '');
}


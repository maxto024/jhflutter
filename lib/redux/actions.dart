import 'package:jhflutter/model/model.dart';

class LoginAction {
  final  User user;
  LoginAction(this.user);
}
class LoginSuccessAction{
  final Auth authKey;

  LoginSuccessAction(this.authKey);

}
class LogoutAction {
  final Auth authKey;
  LogoutAction(this.authKey);
}

class LogoutSuccessAction {
  final Auth authKey;
  LogoutSuccessAction(this.authKey);
}
class GetAuthAction {
}
class LoadedAuthAction {
  final Auth auth;
  LoadedAuthAction(this.auth);
}
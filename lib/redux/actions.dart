import 'package:jhflutter/model/model.dart';

class LoginAction {
  final  User user;
  LoginAction(this.user);
}
class LoginSuccessAction{
  final AuthKey authKey;

  LoginSuccessAction(this.authKey);

}
class LogoutAction {
  final AuthKey authKey;
  LogoutAction(this.authKey);
}

class LogoutSuccessAction {
  final AuthKey authKey;
  LogoutSuccessAction(this.authKey);
}
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jhflutter/model/model.dart';
import 'package:jhflutter/redux/actions.dart';
import 'package:jhflutter/redux/reducers.dart';
import 'package:jhflutter/redux/middleware.dart';
class _ViewModel {
  final User user;
  final Function(User) onLogin;
  final Function() onLogout;


  _ViewModel({
    this.user,
    this.onLogin,
    this.onLogout,
  });

  factory _ViewModel.create(Store<AppState> store) {
    _onLogin(User body) {
      store.dispatch(LoginAction(body));
    }

    _onLogout(AuthKey item) {
      store.dispatch(LogoutAction(item));
    }

    return _ViewModel(
      user: store.state.user,
      onLogin: _onLogin,
      onLogout: _onLogout(AuthKey()),
    );
  }
}
import 'package:redux/redux.dart';
import 'package:jhflutter/model/model.dart';
import 'package:jhflutter/redux/actions.dart';

class ViewModel {
  final User user;
  final Function(User) onLogin;
  final Function() onLogout;
  final Function() isLogged;
  ViewModel({this.user, this.onLogin, this.onLogout, this.isLogged});

  factory ViewModel.create(Store<AppState> store) {
    _onLogin(User body) {
      store.dispatch(LoginAction(body));
    }

    _onLogout() {
      store.dispatch(LogoutAction());
    }

    bool _isLogged() {
      print('what ${store.state.auth.authkey}');
      return store.state.auth.authkey == null ? false : true;
    }

    return ViewModel(
      user: store.state.user,
      onLogin: _onLogin,
      isLogged: _isLogged,
      onLogout: _onLogout,
    );
  }
}

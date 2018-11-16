import 'package:redux/redux.dart';
import 'package:jhflutter/model/model.dart';
import 'package:jhflutter/redux/actions.dart';

class ViewModel {
  final User user;
  final Function(User) onLogin;
  final Function() onLogout;

  ViewModel({
    this.user,
    this.onLogin,
    this.onLogout,
  });

  factory ViewModel.create(Store<AppState> store) {
    _onLogin(User body) {
      store.dispatch(LoginAction(body));
    }

    _onLogout() {
      final AuthKey key = AuthKey(authkey: '');
      store.dispatch(LogoutAction(key));
    }

    return ViewModel(
      user: store.state.user,
      onLogin: _onLogin,
    );
  }
}

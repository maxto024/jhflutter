import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jhflutter/model/model.dart';
import 'package:jhflutter/ui/buildLogin.dart';
import 'package:jhflutter/utils/ViewModel.dart';

class LoginPage extends StatefulWidget {
  final Store<AppState> store;
  LoginPage(this.store);

  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState(store);
}

class _LoginPageState extends State<LoginPage> {
  final Store<AppState> store;
  _LoginPageState(this.store);

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 90.0,
        child: Image.asset('assets/login_logo.png'),
      ),
    );
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        body: StoreConnector<AppState, ViewModel>(
          converter: (Store<AppState> store) => ViewModel.create(store),
          builder: (BuildContext context, ViewModel viewModel) => Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    logo,
                    BuildLogin(viewModel),
                  ],
                ),
              ),
        ));
  }
}

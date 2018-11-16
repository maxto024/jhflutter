import 'package:flutter/material.dart';
import 'package:jhflutter/ui/login_page.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jhflutter/model/model.dart';
import 'package:jhflutter/redux/reducers.dart';
import 'package:jhflutter/redux/middleware.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final store = new Store<AppState>(
    appStateReducer,
        initialState: AppState.initialState(),
    middleware: appStateMiddleware(),
  );
  @override
  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
        store: store,
        child: new MaterialApp(
          title: 'jhFlutter',
          theme: new ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: StoreBuilder<AppState>(
          builder: (BuildContext context, Store<AppState> store) =>
              LoginPage(store),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:jhflutter/ui/login_page.dart';
import 'package:jhflutter/ui/home_page.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jhflutter/model/model.dart';
import 'package:jhflutter/redux/reducers.dart';
import 'package:jhflutter/redux/middleware.dart';
import 'package:jhflutter/redux/actions.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:jhflutter/ui/welcome.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final DevToolsStore<AppState> store = DevToolsStore<AppState>(
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
            onInit: (store) => store.dispatch(GetAuthAction()),
            builder: (BuildContext context, Store<AppState> store) =>
                 HomePage(store),
          ),
          routes: <String, WidgetBuilder>{
             "/signin": (BuildContext context) => new LoginPage(store),
             "/home": (BuildContext context) => new HomePage(store),
          },
        ));
  }
}

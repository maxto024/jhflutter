import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jhflutter/model/model.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jhflutter/utils/ViewModel.dart';

class Welcome extends StatefulWidget {
    final DevToolsStore<AppState> store;
  Welcome(this.store);
  @override
  _WelcomeState createState() => new _WelcomeState(store);
}

class _WelcomeState extends State<Welcome> {
      final DevToolsStore<AppState> store;
  _WelcomeState(this.store);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) => ViewModel.create(store),
        builder: (BuildContext context, ViewModel viewModel) => new Center(
            child: new Container(

               ))
               
        )
               );
  }

  checkForToken(BuildContext context){
      if(store.state.auth.authkey !=null){
        print('hayaay ${store.state.auth.authkey}' );
           //                   Navigator.of(context).pushReplacementNamed("/signin");
      }
      else{
     //   Navigator.of(context).pushReplacementNamed("/signin");
      }
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    super.didUpdateWidget(this.widget);
    checkForToken(context);
  }
}
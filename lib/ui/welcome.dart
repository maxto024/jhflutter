import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jhflutter/model/model.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';


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
        body:new Center(
            child: new Container(

               )));
  }

  checkForToken()async{
      if(store.state.auth.authkey !=null){
        print('hayaay ${store.state.auth.authkey}' );
                     Navigator.of(context).pushReplacementNamed(  "/signin");
      }
      else{
     //   Navigator.of(context).pushReplacementNamed("/signin");
      }
  }

  @override
  void initState() {
    super.initState();
    checkForToken();
  }
}
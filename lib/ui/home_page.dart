import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:jhflutter/model/model.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:jhflutter/utils/ViewModel.dart';
import 'package:jhflutter/ui/login_page.dart';

class HomePage extends StatelessWidget {
  final DevToolsStore<AppState> store;
  HomePage(this.store);
  static String tag = 'home-page';
  @override
  Widget build(BuildContext context) {
    final bool x = false;
    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/logo-jhipster.png'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome To Jhipster Flutter ',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "This is fully functional flutter  app   generated by jhipster-flutter ",
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: Column(
        children: <Widget>[alucard, welcome, lorem],
      ),
    );

    final unSecureUi = ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Drawer'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('Login'),
          onTap: () {
            // Update the state of the app
            // ...
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage(store)),
            );
          },
        ),
        ListTile(
          title: Text('SignUp'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        )
      ],
    );

    return StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) => ViewModel.create(store),
        builder: (BuildContext context, ViewModel viewModel) => Scaffold(
              appBar: AppBar(title: Text('Home')),
              body: body,
              drawer: Drawer(
                  // Add a ListView to the drawer. This ensures the user can scroll
                  // through the options in the Drawer if there isn't enough vertical
                  // space to fit everything.
                  child: viewModel.isLogged()
                      ? SecureUi(viewModel, store)
                      : unSecureUi),
            ));
  }
}

class SecureUi extends StatelessWidget {
  final ViewModel model;
  final DevToolsStore<AppState> store;
  SecureUi(this.model, this.store);
  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Drawer'),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          title: Text('Settings'),
          onTap: () {
            // Update the state of the app
            // ...
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage(store)),
            );
          },
        ),
        ListTile(
          title: Text('Change Password'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('LogOut'),
          onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            model.onLogout();

            Navigator.pop(context);
          },
        )
      ],
    );
  }
}

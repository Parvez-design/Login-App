import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:login_app/main.dart';
import './appinfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _submit() {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext ctx) => AppInfo()));
  }

  Future<Void> _logOutSubmit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userName');
    // SharedPreferences prefs1 =
    //     await SharedPreferences.getInstance();
    prefs.remove('password');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext ctx) => LoginPage()));
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Options',
                textAlign: TextAlign.center,
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: InkWell(
                child: Text('AppInfo'),
                splashColor: Theme.of(context).primaryColor,
                onTap: _submit,
              ),
            ),
            ListTile(
              title: InkWell(
                  splashColor: Theme.of(context).primaryColor,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.power_settings_new),
                      Text('LogOut'),
                    ],
                  ),
                  onTap: _logOutSubmit),
            ),
          ],
        ),
      ),
    );
  }
}

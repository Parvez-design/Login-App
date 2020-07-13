import 'dart:ffi';

import 'package:flutter/material.dart';
import './home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginTools extends StatefulWidget {
  @override
  _LoginToolsState createState() => _LoginToolsState();
}

class _LoginToolsState extends State<LoginTools> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Future<Void> _submit() async {
    if (_formKey.currentState.validate()) {
      final enteredUserName = usernameController.text;
      final enteredPassword = passwordController.text;
      final prefs = await SharedPreferences.getInstance();
      // final prefs1 = await SharedPreferences.getInstance();
      prefs.setString('userName', enteredUserName);
      prefs.setString('password', enteredPassword);
      if (prefs.getString('userName') == 'testusername' &&
          prefs.getString('password') == 'testpassword') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext ctx) => HomePage(),
          ),
        );
      } else {
        final snackbar = SnackBar(
          content: Text('userName/Password is Wrong'),
        );
        Scaffold.of(context).showSnackBar(snackbar);
      }
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Image.asset('images/loginapp.jpg', width: 200, height: 250),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter UserName';
                      }
                      return null;
                    },
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Email/username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    controller: usernameController,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Password';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    ),
                    controller: passwordController,
                  ),
                ),
                RaisedButton(
                    child: Text('Login'),
                    clipBehavior: Clip.antiAlias,
                    textColor: Theme.of(context).buttonColor,
                    color: Theme.of(context).accentColor,
                    onPressed: _submit),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

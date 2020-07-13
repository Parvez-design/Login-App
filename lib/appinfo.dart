import 'package:flutter/material.dart';

class AppInfo extends StatelessWidget {
  static const routeName = 'appinfo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Info'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                child: Padding(
              padding: EdgeInsets.only(left: 15, right: 10),
              child: Text(
                'The App Name is LoginApp. This is a dummy app. This app is developed in flutter. This app supports version from 4.0 to 9.0. This app styling is purely based on android(MaterialApp).',
                textAlign: TextAlign.start,
                style: TextStyle(wordSpacing: 7, fontSize: 15),
              ),
            )),
            SizedBox(
              height: 100,
            ),
            Container(
              child: Text(
                'Thank You',
                overflow: TextOverflow.fade,
                maxLines: 1,
                style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

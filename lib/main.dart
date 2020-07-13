import 'package:flutter/material.dart';
import './home_page.dart';
import './login_tools.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(MyApp());
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var userName = prefs.getString('userName');
  print(userName);
  // SharedPreferences prefs1 = await SharedPreferences.getInstance();
  var password = prefs.getString('password');
  print(password);
  runApp(
    MaterialApp(
        home: userName == null && password == null ? LoginPage() : HomePage()),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      // routes: {
      //   '/': (ctx) => LoginPage(),
      //   HomePage.routeName: (ctx) => HomePage(),
      //   AppInfo.routeName: (ctx) => AppInfo()
      // },
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Login App',
          ),
        ),
        body: LoginTools());
  }
}

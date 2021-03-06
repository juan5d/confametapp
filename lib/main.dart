/* import 'package:firebase_core/firebase_core.dart'; */
import 'package:flutter/material.dart';
import 'package:proyect/page/LoginPage.dart';

void main() {
  /* WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) { */
  runApp(MyApp());
  /* }); */
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Login Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoginPage(),
      routes: routes,
    );
  }
}

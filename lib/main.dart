import 'package:flutter/material.dart';
import 'package:whizbank/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whizbank',
      theme: ThemeData(
        fontFamily: 'Source Code Pro',
        primarySwatch: Colors.indigo,
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

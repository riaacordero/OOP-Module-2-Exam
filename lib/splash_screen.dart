import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_app/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(
            'Splash Screen',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

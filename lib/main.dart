import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whizbank/screens/splash_screen.dart';

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
        textTheme:
            GoogleFonts.sourceCodeProTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.indigo,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

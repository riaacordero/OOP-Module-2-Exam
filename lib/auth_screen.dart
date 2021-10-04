import 'package:flutter/material.dart';
import 'package:my_app/login_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()
                            )
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white, 
                            fontSize: 16
                        ),
                      )
                  ),
              )
            )
            ],
          ),
        )
      )
    );
  }
}
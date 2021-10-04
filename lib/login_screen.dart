import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
                maxWidth: MediaQuery.of(context).size.width,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[Color(0xFFFFFF), Color(0xFFEEEEEE)]
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Image.asset('assets/login.png'),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // <INSERT USER IMAGE HERE>
                        Text("Reliable and secure.",
                            style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 25,
                              fontWeight: FontWeight.w900,
                            )
                        ),
                        SizedBox(height: 10),
                        Text("Never gonna give you up, "
                            + "never gonna let you down.",
                            style: TextStyle(
                                color: Colors.indigo,
                                fontSize: 15,
                                fontWeight: FontWeight.w300
                            )
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Email Address",
                              prefixIcon:
                                  Icon(Icons.email, color: Colors.indigo[200])
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "Password",
                                prefixIcon:
                                    Icon(Icons.lock, color: Colors.indigo[200])
                            )
                        ),
                        SizedBox(height: 10),
                        Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()
                                      )
                                  );
                                },
                                child: Text("Login",
                                    style: TextStyle(
                                        color: Colors.white, 
                                        fontSize: 16
                                    )
                                ),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18)
                                        )
                                    )
                                ),
                              ),
                            )
                        )
                      ],
                    ),
                  )
                ],
              )
          ),
        )
    );
  }
}

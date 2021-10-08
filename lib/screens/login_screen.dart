import 'package:flutter/material.dart';
import 'package:whizbank/screens/dashboard_screen.dart';
import 'package:whizbank/screens/under_construction_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(padding: const EdgeInsets.symmetric(vertical: 25)),
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height,
                        maxWidth: MediaQuery.of(context).size.width),
                      child: Image.asset('assets/login.png',
                      alignment: Alignment.center),
                    ),
                    Padding(padding: const EdgeInsets.only(top: 50)),
                    Column(children: [
                      Text("Welcome to Whizbank",
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3)),
                      Text("Mobile banking has never been this whizzy!",
                        style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 15,
                            fontWeight: FontWeight.w300
                        ),
                        textAlign: TextAlign.center
                      ),]),
                    _LoginForm()
                  ],
                ),
              ),
          ),
        )
    );
  }
}

class _LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<_LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical:20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(width: 3,color: Colors.indigo),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Username",
                      prefixIcon: Icon(Icons.person, color: Colors.indigo[400]),
                      errorStyle: TextStyle(height: 0)
                ),
                validator: (value) => value == "admin" ? null : ''
              ),
              Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5)),
              TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 3, color: Colors.indigo),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock, color: Colors.indigo[400]),
                      errorStyle: TextStyle(height: 0)
                  ),
                  validator: (value) => value == "admin" ? null : ''
              ),
              Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5)),
              Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DashboardScreen()
                                    )
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Invalid credentials. Please try again!'
                                    )
                                  )
                                );
                              }
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
                                ),
                                elevation: MaterialStateProperty.all<double>(0)
                            ),
                          ),
                        ),
                        Text("or"),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => 
                                        UnderConstructionScreen()
                                    )
                                );
                            },
                            child: Text("Create Account",
                                style: TextStyle(
                                    color: Colors.indigo, 
                                    fontSize: 16
                                )
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.white
                                ),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18), 
                                            side: BorderSide(
                                              color: Colors.indigo
                                            )
                                    )
                                ),
                                elevation: MaterialStateProperty.all(0)
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              )
            ],
          ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:my_app/screens/dashboard_screen.dart';

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
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 9,),
                    Image.asset('assets/login.png',
                    width: 350,height:350,alignment: Alignment.center),
                    Column(children: [
                      Text("Welcome to Whizbank",
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text("Mobile banking has never been this whizzy!",
                        style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 15,
                            fontWeight: FontWeight.w300
                        ),
                        textAlign: TextAlign.center
                      ),]),
                    LoginForm()
                  ],
                ),
              )
          ),
        )
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm> {
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
                    errorBorder: OutlineInputBorder(borderSide: BorderSide(width: 3,color: Colors.red)),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Username",
                    prefixIcon: Icon(Icons.person, color: Colors.indigo[400]),
                    errorStyle: TextStyle(height: 0)
                ),
                validator: (value) => value == "admin" ? null : ''
              ),
              SizedBox(height: 10),
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
              SizedBox(height: 10),
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
                                print("Hello I'm here");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()
                                    )
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Invalid credentials. Please try again!'))
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
                                    builder: (context) => LoginScreen()
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
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(18), side: BorderSide(color: Colors.indigo)
                                )
                            ),
                            elevation: MaterialStateProperty.all<double>(0)
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
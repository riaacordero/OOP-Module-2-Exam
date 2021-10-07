import 'package:flutter/material.dart';

class UnderConstructionScreen extends StatelessWidget {
  const UnderConstructionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Row(
      children: <Widget>[new Icon(Icons.arrow_back)],
    );

    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
      ),
      backgroundColor: Colors.indigo,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Image.asset('assets/under-construction.png',
                    height: 500, width: 500),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  '</Beep boop!>',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10)),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'This feature is under construction.'+
                  '\n We apologize for this inconvenience and'+
                  '\nthank you for your support!',
                  style: TextStyle(fontSize: 13, color: Colors.white),textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

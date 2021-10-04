import 'package:flutter/material.dart';

class UnderConstructionScreen extends StatelessWidget {
  const UnderConstructionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Row toolbar = new Row(
      children: <Widget>[new Icon(Icons.arrow_back)],
    );

    return Scaffold(
      appBar: new AppBar(
        title: toolbar,
        elevation: 0,
      ),
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.asset('assets/under-construction.png',
                  height: 500, width: 500),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Under Construction',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Lorem Ipsum',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

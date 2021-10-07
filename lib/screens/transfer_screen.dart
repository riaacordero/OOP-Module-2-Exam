import 'package:flutter/material.dart';

class TransferScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferScreenState();
  }
}

class TransferScreenState extends State<TransferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
        elevation: 0,
        title: Text("Fund Transfer"),
      ),
      body: Text("Hello World"),
    );
  }
}
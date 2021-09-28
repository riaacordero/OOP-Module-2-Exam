import 'package:flutter/material.dart';

class Actions extends StatefulWidget {
  String action;
  String selected;
  String unselected;
  bool isSelected;

  Actions(this.action, this.selected, this.unselected, this.isSelected);

  @override
  _ActionsState createState() => _ActionsState();
}

class _ActionsState extends State<Actions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      width: 125,
      height: 125,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color(0xFF3F51B5),
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(8, 8))
        ],
        borderRadius: BorderRadius.circular(15),
        color: widget.isSelected ? Color(0xFF3F51B5) : Color(0xFFFFFFF),
      ),
      child: Column(
        children: [],
      ),
    );
  }
}

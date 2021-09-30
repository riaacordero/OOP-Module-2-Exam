import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/home_screen.dart';

class ActionCards extends StatefulWidget {
  final String action;
  final String icon;

  ActionCards(this.action, this.icon);

  @override
  _ActionCardsState createState() => _ActionCardsState();
}

class _ActionCardsState extends State<ActionCards> {
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
        color: Color(0xFFFFFFF),
      ),
      child: Column(
        children: [
          SvgPicture.asset(widget.icon),
          SizedBox(height: 9),
          Text(widget.action,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF3F51B5)))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:whizbank/database/accounts.dart';

class AccountsCard extends StatefulWidget {
  const AccountsCard({ Key? key }) : super(key: key);

  @override
  _AccountsCardState createState() => _AccountsCardState();
}

class _AccountsCardState extends State<AccountsCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(right: 10),
            height: 199,
            width: 344,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color(0xFF715FE0),
                      Color(0xFF00669F)
                    ]
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 3,
                      blurRadius: 1,
                      offset: Offset(0, 5)
                  )
                ]
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 30,
                  top: 25,
                  child: Text("ACCOUNT NUMBER",
                      style: TextStyle(
                          color: Colors.white, 
                          fontSize: 10
                      )
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 40,
                  child: Text(accounts[index].accNumber,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20
                      )
                  ),
                ),
                Positioned(
                  right: 30,
                  bottom: 45,
                  child: Text(
                      "₱" +
                          accounts[index].balance.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 25
                      )
                  ),
                ),
                Positioned(
                  right: 30,
                  bottom: 30,
                  child: Text("AVAILABLE BALANCE",
                      style: TextStyle(
                          color: Colors.white, 
                          fontSize: 10
                      )
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}
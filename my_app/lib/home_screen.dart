import 'package:flutter/material.dart';
import 'package:my_app/database/accounts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 8),
            child: ListView(
              physics: ClampingScrollPhysics(),
              children: [
                // MENU BAR
                Container(
                  margin: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(
                        Icons.menu_rounded,
                        color: Colors.grey[400],
                        size: 50,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // HEADER
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome back,",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        Text("Johnny Bravo",
                            style: TextStyle(
                                color: Colors.blue[700],
                                fontSize: 30,
                                fontWeight: FontWeight.w900))
                      ]),
                ),
                Container(
                    height: 199,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: 16, right: 6),
                      scrollDirection: Axis.horizontal,
                      itemCount: accounts.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 199,
                          width: 344,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color:Colors.blue),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 30, top: 25,
                                child: Text("ACCOUNT NUMBER", 
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10
                                )),),
                              Positioned(
                                left: 30, top: 40,
                                child: Text(accounts[index].accNumber,
                                style: TextStyle(
                                  color: Colors.blue[300],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20)),),
                              Positioned(
                                right: 30, bottom: 45,
                                child: Text("₱"+accounts[index].balance.toString(),
                                style: TextStyle(
                                  color: Colors.blue[700],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 25)),),
                              Positioned(
                                right: 30, bottom: 30,
                                child: Text("AVAILABLE BALANCE",
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 10)),)],
                          ),
                         );
                       })
                    )
              ],
            )));
  }
}

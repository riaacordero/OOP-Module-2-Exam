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
                        Text("Lorem Ipsum",
                            style: TextStyle(
                                color: Colors.blue[700],
                                fontSize: 30,
                                fontWeight: FontWeight.w900))
                      ]),
                ),
                Container(
                    height: 199,
                    // child: ListView.builder(
                    //   padding: EdgeInsets.only(left: 16, right: 6),
                    //   scrollDirection: Axis.horizontal,
                    //   itemCount: accounts.length,
                    //   itemBuilder: (context, index) {
                    //     return Container(
                    //       margin: EdgeInsets.only(right: 10),
                    //       height: 199,
                    //       width: 344,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(10),
                    //         color:Colors.white),
                    //     );
                    //   })
                    )
              ],
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:whizbank/cards/account_card.dart';
import 'package:whizbank/cards/action_card.dart';
import 'package:whizbank/database/actions.dart';
import 'package:whizbank/screens/under_construction_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
            margin: const EdgeInsets.only(top: 8),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10)),
                  // HEADER
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome back,",
                            style: TextStyle(
                                fontSize: 18, 
                                fontWeight: FontWeight.w500
                            )
                        ),
                        Text("Juan dela Cruz",
                            style: TextStyle(
                                color: Colors.indigo[700],
                                fontSize: 30,
                                fontWeight: FontWeight.w900
                            )
                        )
                      ]
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10)),
                  Container(
                    child: AccountCardCarousel()
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20)),
                  Text("Actions:",
                      style: TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.w800
                      )
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 175,
                          child: ListView.builder(
                            itemCount: actions.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var current;
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => 
                                          actions[index].navigateTo()));
                                },
                                child: ActionCard(
                                    action: actions[index].action,
                                    icon: actions[index].icon,
                                    isSelected: current == index,
                                    context: this),
                              );
                            },
                          )
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
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
                            child: Text("View Transaction History",
                                style: TextStyle(
                                  color: Colors.white, 
                                  fontSize: 16
                                )
                            ),
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18)
                                    )
                                )
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
        )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:whizbank/database/accounts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class _AccountCard extends StatefulWidget {
  final Account account;

  const _AccountCard({
    required this.account, 
    Key? key
  }) : super(key: key);

  @override
  _AccountCardState createState() => _AccountCardState();
}

class _AccountCardState extends State<_AccountCard> {
  @override
  Widget build(BuildContext context) {
      return Container(
        margin: const EdgeInsets.only(right: 10),
        height: 175,
        width: MediaQuery.of(context).size.width - 36,
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
              child: Text(widget.account.accNumber,
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
                      widget.account.balance.toString(),
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
}

class AccountCardCarousel extends StatefulWidget {
  const AccountCardCarousel({Key? key}) : super(key: key);

  @override
  _AccountCardCarouselState createState() => _AccountCardCarouselState();
}

class _AccountCardCarouselState extends State<AccountCardCarousel> {
  final _pageController = new PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: accounts.length,
            itemBuilder: (context, index) {
              return _AccountCard(account: accounts[index]);
            },
          ),
        ),
        Padding(padding: const EdgeInsets.symmetric(vertical: 8)),
        SmoothPageIndicator(
          controller: _pageController, 
          count: accounts.length,
          effect: WormEffect(
            dotWidth: 12,
            dotHeight: 12
          ),
        )
      ],
    );
  }
}
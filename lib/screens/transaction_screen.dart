import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:whizbank/database/transactions.dart';

class TransactionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
        elevation: 0,
        centerTitle: true,
        title: Text("TRANSACTION HISTORY"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: transactions.isEmpty 
            ? Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: 
                  [Column(
                    children: [
                      SvgPicture.asset('assets/empty-transact.svg'),
                      Padding(padding: const EdgeInsets.symmetric(vertical:15)),
                      Text("Sike!",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                        textAlign: TextAlign.center,),
                      Padding(padding: const EdgeInsets.symmetric(vertical:5)),
                      Text("Your transaction history is currently empty. It's either you have no friends or no money :(",style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey),
                        textAlign: TextAlign.center,)
                    ],
                  ),
                ],
              ),
            )
            : Scrollbar(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ListView.builder(
                  itemCount: transactions.length,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    Transaction currentTransaction = transactions[index];
                    String transactionType = "";
                    switch (currentTransaction.type) {
                      case TransactionType.TRANSFER:
                        transactionType = "Fund Transfer";
                        break;
                      case TransactionType.WITHDRAW:
                        transactionType = "Withdrawal";
                        break;
                      case TransactionType.DEPOSIT:
                        transactionType = "Deposit Money";
                        break;
                    }
              
                    String transactionDateTime = currentTransaction.dateTime
                      .toString()
                      .substring(0, 16);
              
                    return ExpansionTile(
                      title: Text(
                        "$transactionType \n" +
                        "${transactionDateTime}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      children: [
                        ListTile(
                          title: Text(
                            "FROM: ${currentTransaction.accFrom.accNumber}\n" +
                            "TO: ${currentTransaction.accTo}\n" +
                            "AMOUNT: ${currentTransaction.amount}"
                          ),
                        )
                      ],
                    );
                  }
                ),
              ),
            )
        ),
      ),
    );
  }
}
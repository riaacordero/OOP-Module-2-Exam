import 'package:flutter/material.dart';
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
        child: Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: transactions.isEmpty 
                ? Align(
                  alignment: Alignment.center,
                  child: Text("Hello World"),
                )
                : ListView.builder(
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
                )
            )
          )
        ),
      ),
    );
  }
}
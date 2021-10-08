import 'package:flutter/material.dart';
import 'package:whizbank/cards/account_card.dart';
import 'package:whizbank/database/accounts.dart';
import 'package:whizbank/database/transactions.dart';
import 'package:whizbank/screens/dashboard_screen.dart';

class TransferScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransferScreenState();
  }
}

class TransferScreenState extends State<TransferScreen> {
  final _formKey = new GlobalKey<FormState>();
  final _scrollController = new ScrollController();
  final TextEditingController _toController = new TextEditingController();
  final TextEditingController _amountController = new TextEditingController();

  @override
  void dispose() {
    _toController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
        elevation: 0,
        centerTitle: true,
        title: Text("FUND TRANSFER"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Scrollbar(
            isAlwaysShown: true,
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Transfer From:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Padding(padding: const EdgeInsets.symmetric(vertical: 12)),
                    AccountCardList(),
                    Padding(padding: const EdgeInsets.symmetric(vertical: 18)),
                    Text("Transfer To:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    TextFormField(
                      controller: _toController,
                      keyboardType: TextInputType.number,
                      maxLength: 12,
                      decoration: InputDecoration(
                        hintText: "Enter 12-digit account number",
                        counterText: ""
                      ),
                      validator: (String? value) {
                        if (value?.length != 12) {
                          return "Enter a total of 12 digits.";
                        } else if (accounts.any((element) 
                          => (element.accNumber == value))) {
                          return "Cannot transfer to self.";
                        } else {
                          return null;
                        }
                      },
                    ),
                    Padding(padding: const EdgeInsets.symmetric(vertical: 18)),
                    Text("Amount:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Row(
                      children: [
                        Text("PHP",
                          style: TextStyle(
                            fontSize: 16
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20)
                        ),
                        Flexible(
                          child: TextFormField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            textDirection: TextDirection.rtl,
                            decoration: InputDecoration(
                              hintText: "0.00",
                              hintTextDirection: TextDirection.rtl
                            ),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                  return "Enter value.";
                              } else if (double.parse(value) > 
                                  accounts[selectedCardIndex].balance) {
                                  return "Not enough balance.";
                              } else if (double.parse(value) < 200) {
                                return "Not enough amount.";
                              } else {
                                return null;
                              }
                            },
                          )
                        )
                      ],
                    ),
                    Padding(padding: const EdgeInsets.symmetric(vertical: 24)),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          if (selectedCardIndex == -1) {
                            _scrollController.jumpTo(0);
                          } else {
                            if (_formKey.currentState!.validate()) {
                              accounts[selectedCardIndex].balance -= 
                                double.parse(_amountController.text);
                              
                              Transaction newTransaction = new Transaction(
                                accFrom: accounts[selectedCardIndex], 
                                accTo: _toController.text, 
                                amount: double.parse(_amountController.text), 
                                type: TransactionType.TRANSFER, 
                                dateTime: DateTime.now()
                              );

                              transactions.add(newTransaction);

                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) 
                                  => SuccessScreen(
                                    transaction: newTransaction,
                                  )
                                )
                              );
                            }                            
                          }
                        },
                        child: Text("Continue"),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)
                            )
                          )
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ),
          ),
        ),
      )
    );
  }
}

class SuccessScreen extends StatefulWidget {
  final Transaction transaction;

  const SuccessScreen({required this.transaction, Key? key }) : super(key: key);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.check_circle_outline,
              color: Colors.greenAccent,
              size: 100,),
              Padding(padding: const EdgeInsets.symmetric(vertical: 10)),
              Text("Money transfer successful!",style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w600
              )),
              Padding(padding: const EdgeInsets.symmetric(vertical: 5)),
              Text("You successfully transferred " + 
                "${widget.transaction.amount} " + 
                "from ${widget.transaction.accFrom.accNumber} to " + 
                "${widget.transaction.accTo}.", 
                textAlign: TextAlign.center,
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 5)),
              Text("Ref. No.: ${widget.transaction.referenceNumber}"
                , textAlign: TextAlign.center,
              ),
            ]
          ),
        )
      )      
    );
  }
}
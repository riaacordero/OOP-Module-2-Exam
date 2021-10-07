import 'package:whizbank/database/accounts.dart';

enum TransactionType {
  TRANSFER, WITHDRAW, DEPOSIT
}

class Transaction {
  Account accFrom;
  String accTo;
  double amount;
  TransactionType type;
  DateTime dateTime;

  Transaction({
    required this.accFrom, 
    required this.accTo,
    required this.amount,
    required this.type,
    required this.dateTime
  });
}

List<Transaction> transactions = [];
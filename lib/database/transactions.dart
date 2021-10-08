import 'package:whizbank/database/accounts.dart';

int transactionCount = 0;

enum TransactionType {
  TRANSFER, WITHDRAW, DEPOSIT
}

class Transaction {
  Account accFrom;
  String accTo;
  double amount;
  TransactionType type;
  DateTime dateTime;
  String referenceNumber;
  
  Transaction({
    required this.accFrom, 
    required this.accTo,
    required this.amount,
    required this.type,
    required this.dateTime
  }) : referenceNumber = (++transactionCount).toString().padLeft(
    11 - transactionCount.toString().length, "0"
  );
}

List<Transaction> transactions = [];
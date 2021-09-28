class Accounts {
  String user;
  String accNumber; //max 11 char
  double balance;
  int cardColor;

  Accounts(this.user, this.accNumber, this.balance, this.cardColor);
}

List<Accounts> accounts = accountsData
    .map(
      (item) => Accounts(
          item['user'] as String,
          item['accNumber'] as String,
          item['balance'] as double,
          item['cardColor'] as int,
    ),).toList();

var accountsData = [
  {
    "user": "Lorem Ipsum",
    "accNumber": "00023678234",
    "balance": 15080.59,
    "cardColor": 0xFF1E1E99
  },
  {
    "user": "Lorem Ipsum",
    "accNumber": "98675346875",
    "balance": 200.toDouble(),
    "cardColor": 0xFFFF70A3
  }
];

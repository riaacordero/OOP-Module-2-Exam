class Account {
  String user;
  String accNumber; //max 11 char
  double balance;

  Account(this.user, this.accNumber, this.balance);
}

List<Account> accounts = accountsData
    .map(
      (item) => Account(
          item['user'] as String,
          item['accNumber'] as String,
          item['balance'] as double,
      ),
    ).toList();

var accountsData = [
  {
    "user": "Lorem Ipsum",
    "accNumber": "00023678234",
    "balance": 100000.00,
  },
  {
    "user": "Lorem Ipsum",
    "accNumber": "98675346875",
    "balance": 100000.00,
  }
];

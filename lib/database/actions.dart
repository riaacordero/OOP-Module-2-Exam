class Actions {
  String action;
  String icon;

  Actions(this.action, this.icon);
}

List<Actions> actions = actionsData
    .map(
        (item) => Actions(item['action'] as String, item['icon'] as String))
    .toList();

var actionsData = [
  {
    "action": "Money\nTransfer",
    "icon": "assets/col-money.svg",
  },
  {
    "action": "Withdraw",
    "icon": "assets/col-money.svg",
  },
  {
    "action": "Enroll\nAccount",
    "icon": "assets/col-money.svg",
  },
  {
    "action": "Transaction\nHistory",
    "icon": "assets/col-money.svg",
  },
];

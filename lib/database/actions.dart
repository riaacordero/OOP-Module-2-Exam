class Actions {
  String action;
  String icon;

  Actions(this.action, this.icon);
}

List<Actions> actions = actionsData
    .map((item) => Actions(item['action'] as String, item['selected'] as String)).toList();


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
    "action": "Add\nAccount",
    "icon": "assets/col-money.svg",
  },
  {
    "action": "Transaction\nHistory",
    "icon": "assets/col-money.svg",
  },
];

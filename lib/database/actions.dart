class Actions {
  String action;
  String selected;
  String unselected;

  Actions(this.action, this.selected, this.unselected);
}

List<Actions> actions = actionsData.map((item) =>
    Actions(
      item['action'] as String, 
      item['selected'] as String, 
      item['unselected'] as String
    )).toList();

var actionsData = [
  {
    "action": "Money\nTransfer",
    "selected": "assets/white-money.svg",
    "unselected": "assets/col-money.svg"
  },
  {
    "action": "Bank\nWithdraw",
    "selected": "assets/white-money.svg",
    "unselected": "assets/col-money.svg"
  },
  {
    "action": "Insight\nTracking",
    "selected": "assets/white-money.svg",
    "unselected": "assets/col-money.svg"
  },
];

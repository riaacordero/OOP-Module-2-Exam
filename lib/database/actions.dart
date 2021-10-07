import 'package:flutter/widgets.dart';
import 'package:whizbank/screens/under_construction_screen.dart';

class Actions {
  String action;
  String icon;
  Widget Function () navigateTo;

  Actions(this.action, this.icon, this.navigateTo);
}


var actions = [
  Actions(
    "Fund\nTransfer", "assets/col-transfer.svg", () => UnderConstructionScreen()),

  Actions(
    "Cash\nWithdraw", "assets/col-money.svg", () => UnderConstructionScreen()),

  Actions(
    "Enroll\nAccount", "assets/col-enroll.svg", () => UnderConstructionScreen()),

  Actions(
    "Pay\nBills", "assets/col-bills.svg", () => UnderConstructionScreen()),

];

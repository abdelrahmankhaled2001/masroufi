import 'package:flutter/material.dart';

//Simple widget to display the total amount of expenses
class TotalWidget extends StatelessWidget {
  final double totalExpenses;
  final bool portrait;
  const TotalWidget(
      {super.key, required this.totalExpenses, required this.portrait});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: portrait ? double.infinity : 150,
        height: portrait ? 100 : double.infinity,
        margin: portrait
            ? const EdgeInsets.all(10)
            : const EdgeInsets.fromLTRB(10, 40, 10, 40),
        child: Card(
            elevation: 5,
            child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(20),
                child: Center(
                    widthFactor: 3,
                    child: Text(
                      "Total: $totalExpenses EGP",
                      textScaleFactor: 2,
                    )))));
  }
}

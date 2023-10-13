import 'package:flutter/material.dart';

class TotalWidget extends StatelessWidget {
  final double totalExpenses;
  const TotalWidget({super.key, required this.totalExpenses});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 100,
        margin: const EdgeInsets.all(10),
        child: Card(
            elevation: 5,
            child: Center(
                child: Text(
              "Total: $totalExpenses EGP",
              textScaleFactor: 2,
            ))));
  }
}

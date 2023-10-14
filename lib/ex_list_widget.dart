import 'package:flutter/material.dart';
import 'package:masroufi/Expense.dart';
import 'package:masroufi/expense_card.dart';

class ExListWidget extends StatelessWidget {
  final List<Expense> lex;
  final Function removeFunc;
  const ExListWidget({super.key, required this.lex, required this.removeFunc});
  @override
  Widget build(BuildContext context) {
    return Expanded(
        // instead of using a container that you don't know its height

        child: Container(
      margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return ExpenseCard(myExpense: lex[index], removeFunc: removeFunc);
        },
        itemCount: lex.length,
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:masroufi/Expense.dart';
import 'package:masroufi/ex_list_widget.dart';
import 'package:masroufi/new_ex_widget.dart';

final List<Expense> allexpenses = [
  Expense(
    id: "e1",
    title: "Coffee",
    amount: 45,
    date: DateTime.now(),
  ),
  Expense(
    id: "e2",
    title: "DSL",
    amount: 14,
    date: DateTime.now(),
  )
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masroufi',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Expense> expenseList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Masroufi"),
        actions: [
          IconButton(
              onPressed: () {
                showNewExpenseBottomSheet(context);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              height: 100,
              margin: const EdgeInsets.all(10),
              child: const Card(
                  elevation: 5,
                  child: Center(child: Text('totalExpenses go here')))),
          ExListWidget(lex: expenseList, removeFunc: removeExpense)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showNewExpenseBottomSheet(context);
          },
          child: const Icon(Icons.add)),
    );
  }

  void addNewExpense(
      {required String t, required double a, required DateTime date}) {
    setState(() {
      Expense e = Expense(
          id: DateTime.now().toString(), title: t, amount: a, date: date);
      expenseList.add(e);
      Navigator.of(context).pop();
    });
  }

  void removeExpense({required String id}) {
    setState(() {
      expenseList.removeWhere((element) => element.id == id);
    });
  }

  void showNewExpenseBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (sheetContext) {
          return NewExWidget(callBackFunc: addNewExpense);
        });
  }
}
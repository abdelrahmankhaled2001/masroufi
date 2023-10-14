import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExWidget extends StatefulWidget {
  final Function callBackFunc;
  // ignore: prefer_const_constructors_in_immutables
  NewExWidget({super.key, required this.callBackFunc});
  @override
  State<NewExWidget> createState() => _NewExWidgetState();
}

class _NewExWidgetState extends State<NewExWidget> {
  final title = TextEditingController();
  final amount = TextEditingController();
  DateTime selectedDate = DateTime.utc(1970, 1, 1);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          margin: const EdgeInsets.all(10),
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? 250
              : double.infinity,
          child: ListView(reverse: true, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: 'Expense title'),
                  controller: title,
                ),
                TextField(
                    decoration:
                        const InputDecoration(labelText: 'Amount in EGP'),
                    controller: amount),
                Row(children: [
                  Expanded(
                      child: Text(selectedDate == DateTime.utc(1970, 1, 1)
                          ? 'No Date chosen'
                          : DateFormat.yMd().format(selectedDate))),
                  TextButton(
                    onPressed: openDatePicker,
                    child: const Text('Choose date please !'),
                  ),
                ]),
                ElevatedButton(
                  onPressed: () {
                    widget.callBackFunc(
                        t: title.text,
                        a: double.parse(amount.text),
                        date: selectedDate);
                  },
                  child: const Text(
                    "submit",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            )
          ]),
        ));
  }

  void openDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023, 9, 1),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  void rernderNewTextField() {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {}
  }
}

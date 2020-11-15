import 'package:flutter/material.dart';
import 'package:learning_flutter_4/models/transaction.dart';
import 'dart:math';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _onCreate(TextEditingController title, TextEditingController amount) {
    var rand = new Random();

    if (title.text.isEmpty || amountController.text.isEmpty) {
      print("blank input!");
    } else {
      Transaction newTransaction = Transaction(
          id: rand.nextInt(5000).toString(),
          title: title.text,
          amount: double.parse(amount.text),
          date: DateTime.now());
      widget.addTransaction(newTransaction);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            FlatButton(
              onPressed: () {
                _onCreate(titleController, amountController);
              },
              child: Text(
                'Add Transaction',
              ),
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}

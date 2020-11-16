import 'package:flutter/material.dart';
import 'package:learning_flutter_4/models/transaction.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _pickedDate;

  void _onCreate(TextEditingController title, TextEditingController amount,
      DateTime date) {
    var rand = new Random();

    if (title.text.isEmpty ||
        _amountController.text.isEmpty ||
        _pickedDate == null) {
      print("blank input!");
    } else {
      Transaction newTransaction = Transaction(
          id: rand.nextInt(5000).toString(),
          title: title.text,
          amount: double.parse(amount.text),
          date: date);
      widget.addTransaction(newTransaction);
    }

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value != null) {
        return _pickedDate = value;
      }
      setState(() {
        _pickedDate = value;
      });
    });
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
              controller: _titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text(
                    _pickedDate == null
                        ? 'No Date Chosen!'
                        : '${DateFormat.yMMMEd().format(_pickedDate)}',
                    style: TextStyle(color: Colors.red),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: _presentDatePicker,
                  )
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                _onCreate(_titleController, _amountController, _pickedDate);
              },
              textColor: Theme.of(context).primaryColor,
              color: Colors.grey[100],
              child: Text(
                'Add Transaction',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}

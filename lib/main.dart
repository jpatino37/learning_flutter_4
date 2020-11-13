import 'package:flutter/material.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: '1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Groceries',
      amount: 20.00,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          children: [
            Card(
              elevation: 3,
              color: Colors.orange,
              child: Container(
                width: 100,
                height: 100,
                child: Text('Chart!'),
              ),
            ),
            Column(
              children: transactions
                  .map((tx) => Card(
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                tx.amount.toString(),
                              ),
                            ),
                            Column(
                              children: [
                                Text(tx.title),
                                Text(tx.date.toIso8601String())
                              ],
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
        ));
  }
}

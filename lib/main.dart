import 'package:flutter/material.dart';
import 'package:learning_flutter_4/widgets/transaction_list.dart';

import './widgets/new_transactions.dart';
import './models/transaction.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(
      id: '1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: '2',
      title: 'Groceries',
      amount: 20.12,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(Transaction transaction) {
    setState(() {
      _transactions.add(transaction);
    });
  }

  void startAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return NewTransaction(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () => startAddTransaction(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 3,
              child: Container(
                child: Text('Chart!'),
              ),
            ),
            TransactionList(_transactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddTransaction(context),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import './transaction.dart';

void main() {
  runApp(ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expenses App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: "tx1",
      title: "New Shoes",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "tx2",
      title: "Groceries",
      amount: 100,
      date: DateTime.now(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text("Chart"),
              elevation: 5,
            ),
          ),
          Card(
            color: Colors.red,
            child: Text("List of TX"),
          )
        ],
      ),
    );
  }
}

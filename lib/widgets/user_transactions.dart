import 'package:first_flutter_project/models/transaction.dart';
import 'package:flutter/material.dart';

import 'new_transaction.dart';
import 'transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
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
    ),
    Transaction(
      id: "tx2",
      title: "Groceries",
      amount: 100,
      date: DateTime.now(),
    ),
    Transaction(
      id: "tx2",
      title: "Groceries",
      amount: 100,
      date: DateTime.now(),
    ),
    Transaction(
      id: "tx2",
      title: "Groceries",
      amount: 100,
      date: DateTime.now(),
    ),
    Transaction(
      id: "tx2",
      title: "Groceries",
      amount: 100,
      date: DateTime.now(),
    ),
    Transaction(
      id: "tx2",
      title: "Groceries",
      amount: 100,
      date: DateTime.now(),
    ),
    Transaction(
      id: "tx2",
      title: "Groceries",
      amount: 100,
      date: DateTime.now(),
    ),
    Transaction(
      id: "tx2",
      title: "Groceries",
      amount: 100,
      date: DateTime.now(),
    ),
    Transaction(
      id: "tx2",
      title: "Groceries",
      amount: 100,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NewTransaction(_addNewTransaction),
      TransactionList(_userTransactions),
    ]);
  }
}

import 'package:first_flutter_project/widgets/chart.dart';
import 'package:first_flutter_project/widgets/new_transaction.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widgets/transaction_list.dart';

void main() {
  runApp(ExpenseApp());
}

class ExpenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expenses App",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
              button: TextStyle(
                color: Colors.white,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(_addNewTransaction),
          onTap: () {},
        );
      },
    );
  }

  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
    );

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String txId) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == txId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      actions: [
        IconButton(
          onPressed: () => _showAddNewTransaction(context),
          icon: Icon(Icons.add),
        )
      ],
      title: Text("Flutter App"),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Chart(_recentTransactions),
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      appBar.preferredSize.height) *
                  0.4,
            ),
            Container(
              child: TransactionList(_userTransactions, _deleteTransaction),
              height: (MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.top -
                      appBar.preferredSize.height) *
                  0.6,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}

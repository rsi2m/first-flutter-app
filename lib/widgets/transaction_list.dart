import 'package:first_flutter_project/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
        children: [
          Text(
            "No transactions added yet",
            style: Theme
                .of(context)
                .textTheme
                .title,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 200,
            child: Image.asset(
              'assets/images/waiting.png',
              fit: BoxFit.cover,
            ),
          )
        ],
      )
          : ListView.builder(
        itemBuilder: (ctx, index) {
          var tx = transactions[index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: FittedBox(
                    child: Text("\$${tx.amount}"),
                  ),
                ),
              ),
              title: Text(
                tx.title,
                style: Theme
                    .of(context)
                    .textTheme
                    .title,
              ),
              subtitle: Text(DateFormat.yMMMd().format(tx.date)),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}

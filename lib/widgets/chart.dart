import 'package:first_flutter_project/models/day_summary.dart';
import 'package:first_flutter_project/models/transaction.dart';
import 'package:first_flutter_project/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<DaySummary> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double amount = 0;

      for (var tx in recentTransactions) {
        if (tx.date.day == weekDay.day) {
          amount += tx.amount;
        }
      }

      var day = DateFormat.E().format(weekDay).substring(0, 1);

      print(day);
      print(amount);
      return DaySummary(
        day,
        amount,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionValues.map((tx) {
          return ChartBar(
            tx.day,
            tx.amount,
            totalSpending == 0.0 ? 0.0 : tx.amount / totalSpending,
          );
        }).toList(),
      ),
    );
  }

  double get totalSpending {
    return groupedTransactionValues.fold(
        0.0, (sum, element) => sum + element.amount);
  }
}

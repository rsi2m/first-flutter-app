import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final Function restartFunction;

  Result(this.finalScore, this.restartFunction);

  String get resultPhrase {
    return "You did it! Score:" + this.finalScore.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
              onPressed: () => restartFunction(), child: Text("Restart Quiz!"))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;

  Result(this.finalScore);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("You did it! Score:" + this.finalScore.toString()),
    );
  }
}

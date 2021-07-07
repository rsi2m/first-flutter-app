import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function onPressHandler;
  final String answerText;

  Answer(this.answerText, this.onPressHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Text(answerText),
        onPressed: () => onPressHandler(),
      ),
    );
  }
}

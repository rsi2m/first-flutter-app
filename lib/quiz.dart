import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final int questionIndex;
  final List<Map<String, Object>> questions;
  final Function answerQuestion;

  Quiz(this.questionIndex, this.questions, this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Question(questions[questionIndex]['text'].toString()),
          ...(questions[questionIndex]['answers'] as List<String>)
              .map((answer) => Answer(answer, answerQuestion))
              .toList()
        ]);
  }
}

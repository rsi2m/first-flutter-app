import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more questions!");
    }
  }

  final _questions = const [
    {
      'text': 'Какой цвет?',
      'answers': [
        {'text': 'Черный', 'score': 10},
        {'text': 'Белый', 'score': 5},
        {'text': 'Зелёный', 'score': 3},
        {'text': 'Желтый', 'score': 2},
      ]
    },
    {
      'text': 'Какое животное?',
      'answers': [
        {'text': 'Кот', 'score': 10},
        {'text': 'Пес', 'score': 10},
        {'text': 'Гусь', 'score': 10},
        {'text': 'Червь', 'score': 10},
      ]
    },
    {
      'text': 'Какой город?',
      'answers': [
        {'text': 'СФ', 'score': 10},
        {'text': 'Прага', 'score': 10},
        {'text': 'Ору', 'score': 10},
        {'text': 'Сомпа', 'score': 10}
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Дарова, Серёга!"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(_questionIndex, _questions, _answerQuestion)
            : Result(_totalScore),
      ),
    );
  }
}

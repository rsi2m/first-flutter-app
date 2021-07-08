import 'package:flutter/material.dart';

import 'quiz.dart';

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

  void _answerQuestion() {
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
      'answers': ['Черный', 'Белый', 'Зелёный', 'Желтый']
    },
    {
      'text': 'Какое животное?',
      'answers': ['Кот', 'Пес', 'Гусь', 'Червь']
    },
    {
      'text': 'Какой город?',
      'answers': ['СФ', 'Прага', 'Ору', 'Сомпа']
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
            : Center(
                child: Text("You did it!"),
              ),
      ),
    );
  }
}

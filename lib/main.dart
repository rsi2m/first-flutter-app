import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

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
  }

  var _questions = [
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
        body: Column(
          children: [
            Question(_questions[_questionIndex]['text'].toString()),
            ...(_questions[_questionIndex]['answers'] as List<String>)
                .map((answer) => Answer(answer, _answerQuestion))
                .toList()
          ],
        ),
      ),
    );
  }
}

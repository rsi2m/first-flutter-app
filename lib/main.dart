import 'package:flutter/material.dart';
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
    "Какой цвет?",
    "Какое животное?",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Question("Дарова, Серёга!"),
        ),
        body: Column(
          children: [
            Text(_questions[_questionIndex]),
            ElevatedButton(
              child: Text("Answer 1"),
              onPressed: () => _answerQuestion(),
            ),
            ElevatedButton(child: Text("Answer 2"), onPressed: _answerQuestion),
            ElevatedButton(
                child: Text("Answer 3"),
                onPressed: () {
                  print("Чото выбрал");
                }),
          ],
        ),
      ),
    );
  }
}

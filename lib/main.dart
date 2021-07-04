import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void answerQuestion() {
    print("Answer chosen!");
  }

  var questions = [
    "Какой цвет?",
    "Какое животное?",
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
            Text("Вопросик"),
            ElevatedButton(
              child: Text("Answer 1"),
              onPressed: () => answerQuestion(),
            ),
            ElevatedButton(
                child: Text("Answer 2"), onPressed: () => answerQuestion()),
            ElevatedButton(
                child: Text("Answer 3"), onPressed: () => answerQuestion()),
          ],
        ),
      ),
    );
  }
}

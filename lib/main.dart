import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
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
            Text(questions[questionIndex]),
            ElevatedButton(
              child: Text("Answer 1"),
              onPressed: () => answerQuestion(),
            ),
            ElevatedButton(child: Text("Answer 2"), onPressed: answerQuestion),
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

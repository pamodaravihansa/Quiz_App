import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

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

    print('Answer chosen!');
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questionList = [
      'question one',
      'this is question two',
      'this is question three'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('This is app bar'),
        ),
        body: Column(
          children: <Widget>[
            Question(questionList[_questionIndex]),
            Answer(_answerQuestion),
            Answer(_answerQuestion),
            Answer(_answerQuestion),
          ],
        ),
      ),
    );
  }
}

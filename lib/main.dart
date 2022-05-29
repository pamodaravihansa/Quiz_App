import 'package:first_app/question.dart';
import 'package:first_app/result.dart';
import 'package:flutter/material.dart';

import 'quiz.dart';
import 'answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print('Answer chosen!');
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    final _questions = const [
      {
        'questionText': 'What\'s your favourite color?',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 5},
          {'text': 'Green', 'score': 3},
          {'text': 'White', 'score': 1},
        ],
      },
      {
        'questionText': 'What\'s your favourite animal?',
        'answers': [
          {'text': 'Rabit', 'score': 3},
          {'text': 'Snake', 'score': 11},
          {'text': 'Elephant', 'score': 5},
          {'text': 'Lion', 'score': 9},
        ],
      },
      {
        'questionText': 'What\'s your favourite food?',
        'answers': [
          {'text': 'Ice Cream', 'score': 3},
          {'text': 'Pizza', 'score': 5},
          {'text': 'Friend Chicken', 'score': 8},
          {'text': 'Develled Frogs', 'score': 11},
        ],
      },
    ];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('This is app bar'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}

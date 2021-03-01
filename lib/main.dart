import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {
          'text': 'Pink',
          'score': 10,
        },
        {
          'text': 'Purple',
          'score': 9,
        },
        {
          'text': 'Red',
          'score': 7,
        },
        {
          'text': 'Blue',
          'score': 8,
        },
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {
          'text': 'Duck',
          'score': 10,
        },
        {
          'text': 'Penguin',
          'score': 9,
        },
        {
          'text': 'Lion',
          'score': 7,
        },
        {
          'text': 'Narwhal',
          'score': 8,
        }
      ],
    },
    {
      'questionText': 'What is your favorite food?',
      'answers': [
        {
          'text': 'Strawberry',
          'score': 10,
        },
        {
          'text': 'Tomato',
          'score': 7,
        },
        {
          'text': 'Chocolate',
          'score': 9,
        },
        {
          'text': 'Popcorn',
          'score': 8,
        },
      ],
    },
  ];

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
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

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
  var _questionCounter = 0;

  void _answerQuestion() {
    setState(() {
      _questionCounter += 1;
    });

    print(_questionCounter);
    print('Answer chosen ');
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'question': 'Favourite color',
        'answers': ['Red', 'Blue', 'Yellow'],
      },
      {
        'question': 'Favourite animal',
        'answers': ['Dog', 'Cat', 'Rabbit'],
      },
      {
        'question': 'Favourite team',
        'answers': ['CSK', 'RCB', 'MI'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
          backgroundColor: Colors.purpleAccent,
        ),
        body: Column(children: [
          Question(
            questions[(_questionCounter) % questions.length]['question']
                .toString(),
          ),
          ...(questions[_questionCounter % questions.length]['answers']
                  as List<String>)
              .map((answer) {
            return Answer(_answerQuestion, answer);
          }).toList(),
        ]),
      ),
    );
  }
}

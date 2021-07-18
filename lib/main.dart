import 'package:flutter/material.dart';

import 'package:first_app/quiz.dart';
import 'package:first_app/results.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final questions = const [
    {
      'questionText': 'What\'s your favourite color',
      'answer': [
        {'text': 'Blue', 'score': 1},
        {'text': 'Black', 'score': 0},
        {'text': 'Green', 'score': 0},
        {'text': 'White', 'score': 0}
      ],
    },
    {
      'questionText': 'What\'s the name of your animal',
      'answer': [
        {'text': 'Rabbit', 'score': 0},
        {'text': 'Snake', 'score': 0},
        {'text': 'Lion', 'score': 0},
        {'text': 'Cheetah', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favourite game',
      'answer': [
        {'text': 'Mobile Legend', 'score': 1},
        {'text': 'Call of Duty', 'score': 1},
        {'text': 'Fall of Man', 'score': 1},
        {'text': 'Pes', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s the name of your movie',
      'answer': [
        {'text': 'Avengers', 'score': 1},
        {'text': 'Space Jam', 'score': 1},
        {'text': 'The Conjuring', 'score': 0},
        {'text': 'Transformers', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s the name of my favourite hobby',
      'answer': [
        {'text': 'Reading', 'score': 1},
        {'text': 'Coding', 'score': 1},
        {'text': 'Going out', 'score': 0},
        {'text': 'Playing games', 'score': 1}
      ],
    },
    {
      'questionText':
          'What\'s the name of the counry i would like to travel to',
      'answer': [
        {'text': 'USA', 'score': 0},
        {'text': 'Australia', 'score': 1},
        {'text': 'Japan', 'score': 1},
        {'text': 'Canada', 'score': 1}
      ],
    },
  ];
  var questionIndex = 0;
  int totalScore = 0;

  void restartQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  void answerQuestion(int score) {
    totalScore += score;
    setState(() {
      questionIndex = questionIndex + 1;
    });
    if (questionIndex < questions.length) {
      print('We still have more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: questionIndex < questions.length
            ? Quiz(
                answerQuestion: answerQuestion,
                questionIndex: questionIndex,
                questions: questions)
            : Result(
                restartQuiz: restartQuiz,
                totalScore: totalScore,
              ),
      ),
    );
  }
}

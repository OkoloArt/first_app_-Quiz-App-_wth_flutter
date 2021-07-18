import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final VoidCallback restartQuiz;
  final int totalScore;
  Result({required this.totalScore, required this.restartQuiz});

  String get resultPhrase {
    String resultText = '';
    if (totalScore <= 5) {
      resultText = 'You don\' know me at all.';
    } else if (totalScore > 5 && totalScore <= 9) {
      resultText = 'You know little about me.';
    } else if (totalScore == 10) {
      resultText = 'You know me too well and that\'s weird.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(onPressed: restartQuiz, child: Text('Restart Quiz')),
        ],
      ),
    );
  }
}

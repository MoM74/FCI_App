import 'package:flutter/material.dart';

class MyQuiz extends StatelessWidget {
  final String quizname;

  const MyQuiz({required this.quizname});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          'assets/images/logo.jpg',
          width: 100,
        ),
        Text(
          quizname,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
        ),
      ],
    );
  }
}

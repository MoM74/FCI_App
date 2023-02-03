import 'package:flutter/material.dart';

class MyLecture extends StatelessWidget {
  final String lecname;

  const MyLecture({required this.lecname});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          'assets/images/logo.jpg',
          width: 100,
        ),
        Text(
          lecname,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
        ),
      ],
    );
  }
}

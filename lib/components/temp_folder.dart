import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyFolder extends StatelessWidget {
  final String mytext;
  final String hinttext;

  const MyFolder({required this.mytext, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          SvgPicture.asset(
            'assets/images/folder.svg',
            width: 70,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            hinttext,
            style: TextStyle(fontStyle: FontStyle.normal, fontSize: 14),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            mytext,
            style: TextStyle(fontWeight: FontWeight.normal, fontSize: 24),
          ),
        ],
      ),
    );
  }
}

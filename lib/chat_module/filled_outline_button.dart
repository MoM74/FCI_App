import 'package:flutter/material.dart';

import 'package:fci_project/shared/components/constants.dart';


class FillOutlineButton extends StatelessWidget {
  const FillOutlineButton({
    Key? key,
    this.isFilled = true,
    required this.press,
    required this.text,
  }) : super(key: key);

  final bool isFilled;
  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: const BorderSide(color: Colors.white),
      ),
      elevation: isFilled ? 2 : 0,
      splashColor: Colors.white,
      color: isFilled ? Colors.blue : Colors.transparent,
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(
          color: isFilled ? Colors.white : Colors.black,
          fontSize: 12,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class LineBetweenText extends StatelessWidget {
  const LineBetweenText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 20.0),
            child: const Divider(
              height: 36,
            ),
          ),
        ),
        Text(text),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 20.0),
            child: const Divider(
              height: 36,
            ),
          ),
        ),
      ],
    );
  }
}

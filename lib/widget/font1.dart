import 'package:flutter/material.dart';

class Text1 extends StatelessWidget {
  double? size;
  Color? color;
  String font = '';

  Text1(
      {Key? key, this.color = Colors.black, this.size = 30, required this.font})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      font,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

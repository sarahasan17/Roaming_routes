import 'package:flutter/material.dart';
import 'package:travelling_app/widget/font2.dart';
import 'package:travelling_app/widget/font1.dart';

class Appbutton extends StatelessWidget {
  Appbutton({
    Key? key,
    required this.size,
    this.color,
    this.textcolor,
    required this.backgroundcolor,
    this.text = '',
    this.icon,
    this.icIcon = false,
  }) : super(key: key);
  final double size;
  final Color? color;
  final Color backgroundcolor;
  final Color? textcolor;
  String text;
  IconData? icon;
  bool icIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.0),
      height: size,
      width: size,
      decoration: BoxDecoration(
          border: Border.all(color: backgroundcolor),
          borderRadius: BorderRadius.circular(10.0),
          color: color),
      child: Center(
          child: icIcon == false
              ? Text1(size: 20, font: text, color: textcolor)
              : (Icon(
                  icon,
                  color: Colors.black54,
                ))),
    );
  }
}

import 'package:flutter/material.dart';

class Mypage extends StatelessWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "This is my page",
        style: TextStyle(color: Colors.black54),
      ),
    );
  }
}

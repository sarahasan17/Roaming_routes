import 'package:flutter/material.dart';

class Barpage extends StatelessWidget {
  const Barpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "This is bar page",
        style: TextStyle(color: Colors.black54),
      ),
    );
  }
}

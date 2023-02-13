import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final bool istext;
  final double size;
  const Button(
      {Key? key, this.istext: false, required this.text, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 50,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xFF2D51B2),
      ),
      child: Container(
        margin: EdgeInsets.only(left: 10.0),
        child: Row(
          mainAxisAlignment: istext == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            istext == true
                ? Text(
                    text,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                : Container(),
            Container(
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

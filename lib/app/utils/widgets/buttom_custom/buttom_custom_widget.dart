import 'package:flutter/material.dart';

class ButtonCustomWidget extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final Color color;
  final Color textColor;
  ButtonCustomWidget({this.onPressed, this.text, this.color, this.textColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.only(left: 30, right: 30),
      height: 50,
      width: double.infinity,
      child: FloatingActionButton(
        splashColor: Colors.transparent,
        backgroundColor: color,
        child: Text(text.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 1,
              wordSpacing: 1,
              color: textColor,
              fontWeight: FontWeight.bold,
            )),
        highlightElevation: 0,
        onPressed: onPressed,
        isExtended: true,
        elevation: 0,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_journal/contants/theme.dart';

class CircularButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;

  const CircularButton({Key key, this.icon, this.onPressed}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      child: IconButton(
        iconSize: 18,
        icon: Icon(icon, color: primaryDarkBlue),
        onPressed: onPressed,
      ),
    );
  }
}

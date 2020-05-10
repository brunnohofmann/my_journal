import 'package:flutter/material.dart';
import 'package:my_journal/contants/theme.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final FontWeight weight;
  final Color color;
  final TextAlign align;
  final double size;

  const CustomTitle(
      {Key key,
      this.title,
      this.weight,
      this.color,
      this.align: TextAlign.left,
      this.size: 22})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(this.title,
        textAlign: align,
        style: TextStyle(
            fontSize: size,
            color: color != null ? color : primaryDarkBlue,
            fontWeight: weight == null ? FontWeight.normal : weight));
  }
}

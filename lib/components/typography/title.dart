import 'package:flutter/material.dart';
import 'package:my_journal/contants/theme.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final FontWeight weight;

  const CustomTitle({Key key, this.title, this.weight = null})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(this.title,
        style: TextStyle(
            fontSize: 22,
            color: primaryDarkBlue,
            fontWeight: weight == null ? FontWeight.normal : weight));
  }
}

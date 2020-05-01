import 'package:flutter/material.dart';
import 'package:my_journal/contants/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;

  const CustomButton({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: Colors.white,
        highlightColor: tertiaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () {},
        child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(
              text.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: secondaryColor),
            )),
      ),
    );
  }
}
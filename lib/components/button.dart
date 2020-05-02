import 'package:flutter/material.dart';
import 'package:my_journal/contants/theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isLoading;

  const CustomButton({Key key, this.text, this.onPressed, this.isLoading}) : super(key: key);

  _loadingControl() {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 1,
          valueColor: AlwaysStoppedAnimation<Color>(secondaryColor),
        ),
      );
    }
    return Text(
      text.toUpperCase(),
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: secondaryColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: Colors.white,
        highlightColor: tertiaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: this.onPressed,
        child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: _loadingControl()
        ),
      ),
    );
  }
}
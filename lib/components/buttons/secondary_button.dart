import 'package:flutter/material.dart';
import 'package:my_journal/contants/theme.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isLoading;

  const SecondaryButton({Key key, this.text, this.onPressed, this.isLoading}) : super(key: key);

  _loadingControl() {
    if (isLoading) {
      return SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 1,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    }
    return Text(
      text.toUpperCase(),
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: secondaryColor,
        highlightColor: primaryColor,
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
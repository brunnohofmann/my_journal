import 'package:flutter/material.dart';

import '../theme.dart';

class FormTitle extends StatelessWidget {
  final bool isRequired;
  final TextEditingController controller;

  const FormTitle({Key key, this.isRequired = false, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: this.controller,
        maxLines: 3,
        minLines: 1,
        style: TextStyle(
            fontSize: 22,
            color: primaryDarkBlue,
            fontWeight: FontWeight.bold
        ),
        cursorColor: primaryColor,
        keyboardType: TextInputType.text,
        validator:  _validateText,
        decoration: InputDecoration(
          border:InputBorder.none,
          hintText: "Title",
        ),
      ),
    );
  }

  String _validateText(String text) {
    if (text.isEmpty && isRequired) {
      return "Write a text";
    }
    return null;
  }
}

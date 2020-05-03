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
        maxLines: 1,
        minLines: 1,
        style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),
        cursorColor: primaryColor,
        keyboardType: TextInputType.text,
        validator:  _validateText,
        decoration: InputDecoration(
          border:InputBorder.none,
          hintText: "Title",
          hintStyle: TextStyle(color: Colors.white)
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

import 'package:flutter/material.dart';
import 'package:my_journal/contants/theme.dart';

class FormText extends StatelessWidget {
  final bool isRequired;
  final TextEditingController controller;

  const FormText({Key key, this.isRequired, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        cursorColor: primaryColor,
        controller: controller,
        validator:  _validateText,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        minLines: 1,
        style: TextStyle(
            fontSize: 15,
            color: primaryDarkBlue,
            fontWeight: FontWeight.bold
        ),
        decoration: InputDecoration(
          border:InputBorder.none,
          hintText: "Text",
//            border: OutlineInputBorder()
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

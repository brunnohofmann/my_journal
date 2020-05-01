import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page) {
  return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}

void pop(BuildContext context) {
  return Navigator.pop(context);
}

goHome(BuildContext context){
  Navigator.popUntil(
    context,
    ModalRoute.withName(Navigator.defaultRouteName),
  );
}
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.widget.dart';

Future push(BuildContext context, Widget page, {bool withNavBar = false}) {
  return pushNewScreen(context, screen: page, withNavBar: withNavBar);
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
import 'package:flutter/material.dart';

Map<int, Color> color =
{
  50:Color(0xff89B7E3),
  100:Color.fromRGBO(136,14,79, .2),
  200:Color.fromRGBO(136,14,79, .3),
  300:Color.fromRGBO(136,14,79, .4),
  400:Color.fromRGBO(136,14,79, .5),
  500:Color.fromRGBO(136,14,79, .6),
  600:Color.fromRGBO(136,14,79, .7),
  700:Color.fromRGBO(136,14,79, .8),
  800:Color.fromRGBO(136,14,79, .9),
  900:Color.fromRGBO(136,14,79, 1),
};

final MaterialColor primaryColor = MaterialColor(0xff89B7E3, color);
final MaterialColor primaryDarkBlue = MaterialColor(0xff4C5C76, color);
final MaterialColor secondaryColor = MaterialColor(0xff3E9DFE, color);
final MaterialColor tertiaryColor = MaterialColor(0xffEEF6FE, color);

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_journal/contants/theme.dart';
import 'package:my_journal/routes/root_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primarySwatch: primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: RootPage());
  }
}

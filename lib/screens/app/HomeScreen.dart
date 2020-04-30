import 'package:flutter/material.dart';
import 'package:my_journal/contants/theme.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(),
          ),
          Expanded(
            child: Container(
              color: tertiaryColor,
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    IconButton(
                      color: secondaryColor,
                      icon: Icon(Icons.add),
                      onPressed: (){ print('uiadhd');},
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

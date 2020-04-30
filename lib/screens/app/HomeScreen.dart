import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:my_journal/contants/theme.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;

    return Stack(children: [
      Container(
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
                        onPressed: () {
                          print('uiadhd');
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        height: _screenHeight * .60,
        top: _screenHeight * .20,
        left: 30,
        right: 0,
        child: Container(
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                "https://live.staticflickr.com/7796/18057146478_782b02bf3a_b.jpg",
                fit: BoxFit.fill,
              );
            },
            itemCount: 10,
            itemWidth: 300.0,
            layout: SwiperLayout.STACK,
          ),
        ),
      ),
    ]);
  }
}

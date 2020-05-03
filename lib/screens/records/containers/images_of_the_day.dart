import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_journal/components/rounded_image.dart';
import 'package:my_journal/components/typography/title.dart';
import 'package:my_journal/contants/theme.dart';
import 'package:my_journal/helpers/images.dart';

class ImagesOfTheDay extends StatelessWidget {

  final Function onGetImage;
  final List<File> images;


  const ImagesOfTheDay({Key key, this.onGetImage, this.images}) : super(key: key);

  Future getImage() async {
    var image = await getImageFromGallery();
    onGetImage(image);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomTitle(title: 'Images of the Day', weight: FontWeight.bold),
          IconButton(
            color: secondaryColor,
            icon: Icon(Icons.add),
            onPressed: getImage,
          )
        ],
      ),
      AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: images.length > 0 ? 400 : 0,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          for (var item in images)
            RoundedImage(
              imageURL: item,
            ),
        ]),
      ),
    ]);
  }
}

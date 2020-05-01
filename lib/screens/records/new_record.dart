import 'package:flutter/material.dart';
import 'package:my_journal/components/button.dart';
import 'package:my_journal/components/rounded_image.dart';
import 'package:my_journal/components/typography/title.dart';
import 'package:my_journal/contants/records/form_text.dart';
import 'package:my_journal/contants/records/form_title.dart';
import 'package:my_journal/contants/theme.dart';

class NewRecordScreen extends StatelessWidget {
  final _titleController = TextEditingController();
  final _textController = TextEditingController();

  Widget AddImages() {
    return Container(
        padding: EdgeInsets.only(top: 24),
        child: Column(children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                CustomTitle(
                    title: 'Images of the Day', weight: FontWeight.bold),
                IconButton(
                  color: secondaryColor,
                  icon: Icon(Icons.add),
                  onPressed: () {
                    print('caraio');
                  },
                )
              ],
            ),
          ),
          Container(
            height: 400,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                RoundedImage(
                  imageURL:
                      "https://live.staticflickr.com/7796/18057146478_782b02bf3a_b.jpg",
                ),RoundedImage(
                  imageURL:
                      "https://live.staticflickr.com/7796/18057146478_782b02bf3a_b.jpg",
                ),RoundedImage(
                  imageURL:
                      "https://live.staticflickr.com/7796/18057146478_782b02bf3a_b.jpg",
                ),RoundedImage(
                  imageURL:
                      "https://live.staticflickr.com/7796/18057146478_782b02bf3a_b.jpg",
                ),RoundedImage(
                  imageURL:
                      "https://live.staticflickr.com/7796/18057146478_782b02bf3a_b.jpg",
                ),
              ],
            ),
          ),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 24),
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: 40, bottom: 70),
          children: [
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: FormTitle(
                controller: _titleController,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: FormText(
                controller: _textController,
              ),
            ),
            AddImages(),
            Container(
                padding: EdgeInsets.only(top: 24, left: 20, right: 20),
                child: CustomButton(text: 'Save'))
          ],
        ),
      ),
    );
  }

//  //////////////////////////////VALIDATOR

}

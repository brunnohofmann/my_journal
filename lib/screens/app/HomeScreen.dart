import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:my_journal/components/add_record_card.dart';
import 'package:my_journal/components/circular_button.dart';
import 'package:my_journal/components/mascot.dart';
import 'package:my_journal/components/record_cover_card.dart';
import 'package:my_journal/components/typography/title.dart';
import 'package:my_journal/contants/theme.dart';
import 'package:my_journal/helpers/navigation.dart';
import 'package:my_journal/repositories/records_repository.dart';
import 'package:my_journal/screens/records/new_record.dart';

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _images = new List<Widget>();

  @override
  void initState() {
    _images.add(AddRecordCard());
    getCoverRecords();
    super.initState();
  }

  getCoverRecords() async{
    var records = await getCoverRecordsService();
    records.documents.forEach((record) {
      _images.add(RecordCoverCard(record: record.data));
    });

    setState(() {
      _images: _images;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    double _screenWidth = MediaQuery.of(context).size.width;

    return Stack(children: [
      Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: EdgeInsets.only(bottom: 10), child: Mascot()),
                    CustomTitle(title: 'Hello Brunno!'),
                    CustomTitle(title: 'How have you been today?')
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: tertiaryColor,
                child: SafeArea(
                  child: Column(
                    children: [
                      CircularButton(
                        icon: Icons.add,
                        onPressed: () {
                          push(context, NewRecordScreen());
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
        bottom: _screenHeight * 0.05,
        left: 0,
        right: 0,
        child: Container(
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return _images[index];
            },
            itemCount: _images.length,
            itemWidth: _screenWidth * .85,
            itemHeight: _screenHeight * .60,
            layout: SwiperLayout.STACK,
          ),
        ),
      ),
    ]);
  }
}

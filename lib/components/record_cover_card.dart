import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:my_journal/components/typography/title.dart';
import 'package:my_journal/contants/theme.dart';
import 'package:my_journal/helpers/navigation.dart';
import 'package:my_journal/screens/records/new_record.dart';

class RecordCoverCard extends StatelessWidget {
  final dynamic record;

  const RecordCoverCard({Key key, this.record}) : super(key: key);

  Widget _getCardHeader() {
    return Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              record['title'],
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      blurRadius: 3.0,
                      color: Color.fromARGB(50, 0, 0, 0),
                    )
                  ]),
            ),
            CustomTitle(
              title:
                  formatDate(record['date'].toDate(), [dd, '/', M, '/', yyyy]),
              color: Colors.white,
              size: 16,
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () async {
        push(context, NewRecordScreen());
      },
      child: Stack(
        children: <Widget>[
          Container(
            width: _screenWidth * .85,
            height: 500,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                record['cover'],
                fit: BoxFit.cover,
              ),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: Offset(
                    5.0,
                    5.0,
                  ),
                )
              ],
            ),
          ),
          _getCardHeader()
        ],
      ),
    );
  }
}

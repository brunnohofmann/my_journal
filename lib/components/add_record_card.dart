import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_journal/contants/theme.dart';
import 'package:my_journal/helpers/navigation.dart';
import 'package:my_journal/screens/records/new_record.dart';

class AddRecordCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () async{ push(context, NewRecordScreen());},
      child: Container(
        margin: EdgeInsets.only(right: 10, left: 20),
        width: _screenWidth * .85,
        height: 400,
        child: Container(
          padding: EdgeInsets.all(80),
          child: ClipRRect(
            child: SvgPicture.asset(
              'assets/imgs/edit.svg',
              semanticsLabel: 'Mascot',
            ),
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Mascot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: SvgPicture.asset(
          'assets/imgs/mascot.svg',
          semanticsLabel: 'Mascot',
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String imageURL;

  const RoundedImage({Key key, this.imageURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 20),
      width: 250,
      height: 400,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.network(
          imageURL,
          fit: BoxFit.cover,
        ),
      ),
      decoration: BoxDecoration(
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
    );
  }
}

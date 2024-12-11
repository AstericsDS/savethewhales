import 'package:flutter/material.dart';

class Googlemap extends StatelessWidget{
  const Googlemap ({super.key} );

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double boxSize = screenWidth * 0.3;
    return Container(
      width: boxSize,
      height: boxSize,
      margin: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      )
    );
  }
}
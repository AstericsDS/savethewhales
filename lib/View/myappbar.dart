import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Myappbar extends StatelessWidget{
  const Myappbar({super.key});

  @override
  Widget build (BuildContext context){
    return Container(
      height: 56,
      child: AppBar(
        title: Text(
          'Save the Whales',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
        leading: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/svgs/arrow-left.svg',
            height: 20,
            width: 20,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 37,
            child: SvgPicture.asset(
              'assets/svgs/three-dots.svg',
              height: 20,
              width: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
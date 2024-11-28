import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Mainmenu extends StatelessWidget{
  const Mainmenu ({
    super.key,
    required this.name,
    required this.ukuran
    });

    final String name;
    final double ukuran;
  
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
              Container(
                width: ukuran,
                height: ukuran,
                decoration: BoxDecoration(
                  color: Colors.indigo[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/img-box.svg',
                      width: 75,
                      height: 75,
                    ),
                    Text(
                      'Option 1',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
        );
  }
}
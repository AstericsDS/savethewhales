import 'package:flutter/material.dart';
import 'package:savethewhales/View/myappbar.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:savethewhales/Model/googlemap.dart';

class Map extends StatelessWidget{
  const Map({
    super.key
  });

  @override
  Widget build (BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          const Myappbar(),
          Container(
            height: 758,
            margin: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
          
          // Row(
          //   children: [
          //     SizedBox(
          //       width: 200,
          //       height: 300,
          //       child:
          //       Card(
          //         child: 
          //           Text(
          //             'Halo bjir',
          //             textAlign: TextAlign.center,
          //           ),
          //       ),
          //     )
          //   ],
          // )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.map_rounded), label: 'Map'),
        BottomNavigationBarItem(icon: Icon(Icons.request_quote_rounded), label: 'Bill'),
      ]),
    );
  }
}
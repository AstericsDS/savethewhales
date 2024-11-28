import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../template/custom_Appbar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(child: Container(color: Colors.blue,),titled: 'Save The Whales', height: 150),
      body: Column(
        children: [
          Container(
            child: Text('map coming soon',
            textAlign: TextAlign.center,
            ),
            height: 180,
            width: double.maxFinite,
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
          SearchField(),
          SizedBox(
            height: 40,
          ),
          
          // INI BUAT CLASS BARU
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Whales(name: 'udin', image: 'assets/svgs/whale-1.svg'),
              const Whales(name: 'makmur', image: 'assets/svgs/whale-2.svg'),
            ]
          ),
          SizedBox(
                height: 20,
              ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Whales(name: 'supratman', image: 'assets/svgs/whale-3.svg'),
              const Whales(name: 'joko', image: 'assets/svgs/whale-4.svg'),
            ],
          )
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

class Header extends AppBar{
  Header({super.key, required this.titled});

  final String titled;

  AppBar build(BuildContext context){
    return AppBar(
      title: Text(
        titled,
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
    );
  }
}

class Whales extends StatelessWidget{
  const Whales ({
    // super.key,
    required this.name,
    required this.image
    });

    final String name;
    final String image;
  
  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    double boxSize = screenWidth * 0.3;
    return Column(
      children: [
              Container(
                width: boxSize,
                height: boxSize,
                decoration: BoxDecoration(
                  color: Colors.indigo[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      image,
                      width: 75,
                      height: 75,
                    ),
                    Text(
                      name,
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

class SearchField extends Container{
  SearchField({
    super.key
  });

  @override
  Container build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 40,
              spreadRadius: 0.0),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            hintText: 'Search anything',
            hintStyle: TextStyle(
              color: Colors.black87,
            ),
            fillColor: Colors.blue[100],
            contentPadding: EdgeInsets.all(10),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset('assets/svgs/search.svg'),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
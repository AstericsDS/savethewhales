import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
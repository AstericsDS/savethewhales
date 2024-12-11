import 'package:flutter/material.dart';
import 'package:savethewhales/pages/home.dart';
import 'package:savethewhales/Controller/map.dart';
// import 'dart:html' as html;
void main() {
  // html.window.history.pushState(null, 'home', '/');
  // html.window.history.pushState(null, 'map', '/map');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const Map(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const Homepage(),
      //   '/map': (context) => const Map(),
      //   },
    );
  }
}
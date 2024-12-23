import 'package:flutter/material.dart';
import 'package:savethewhales/pages/home.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
Future main() async {

// Initialize FFI
sqfliteFfiInit();


 databaseFactory = databaseFactoryFfi;
 runApp(MyApp());
}
// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const Homepage(),
    );
  }
}
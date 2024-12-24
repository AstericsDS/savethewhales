import 'package:flutter/material.dart';

class AboutWhales extends StatefulWidget {
  const AboutWhales({super.key});

  @override
  State<AboutWhales> createState() => _AboutWhalesState();
}

class _AboutWhalesState extends State<AboutWhales> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About whales'),
      ),
      body: main(),

    );
  }

  Widget main() {
    return Text('jomok');
  }
}

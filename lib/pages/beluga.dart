import 'package:flutter/material.dart';

class Beluga extends StatelessWidget {
  const Beluga({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Beluga'),
        ),
        body: main());
  }

  Widget main() {
    return Column();
  }
}

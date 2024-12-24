import 'package:flutter/material.dart';
import 'package:savethewhales/models/whale.dart';
import 'package:savethewhales/services/database_service.dart';

class Orca extends StatefulWidget {
  const Orca({super.key});

  @override
  State<Orca> createState() => _OrcaState();
}

class _OrcaState extends State<Orca> {
  final DatabaseService _databaseService = DatabaseService.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Paus Orca'),
        ),
        body: main());
  }

  Widget main() {
    return FutureBuilder(
      future: _databaseService.getWhale(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data?.length ?? 0,
          itemBuilder: (context, index) {
            Whale whale = snapshot.data![index];
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Image.asset(
                      'assets/svgs/orca-view.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

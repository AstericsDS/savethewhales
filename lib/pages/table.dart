import 'package:flutter/material.dart';
import 'package:savethewhales/models/bill.dart';
import 'package:savethewhales/services/database_service.dart';

class BillListPage extends StatefulWidget {
  @override
  _BillListPageState createState() => _BillListPageState();
}

class _BillListPageState extends State<BillListPage> {
  final DatabaseService _databaseService = DatabaseService.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bills")),
      body: billList(),
    );
  }

  Widget billList() {
    return FutureBuilder(
        future: _databaseService.getBill(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              Bill bill = snapshot.data![index];
              return ListTile(
                title: Text(bill.name),
              );
            },
          );
        });
  }
}

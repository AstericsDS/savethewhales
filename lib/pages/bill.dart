import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:savethewhales/services/database_service.dart';

const List<String> list = <String>['Visa', 'Credit', 'QRIS'];

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  final DatabaseService _databaseService = DatabaseService.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            mainMenu(),
          ],
        ),
      ),
    );
  }

  Column mainMenu() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Text(
            'Donation',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold 
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your name',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your phone',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your email',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: All()
        )
      ],
    );
  }
}

class All extends StatefulWidget {
  const All({super.key});

  @override
  State<All> createState() => _AllState();
}

typedef MenuEntry = DropdownMenuEntry<String>;

class _AllState extends State<All> {
  static final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
    list.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)),
  );
  String dropdownValue = list.first;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DropdownMenu<String>(
          width: MediaQuery.of(context).size.width,
          initialSelection: list.first,
          label: Text('Choose your payment method'),
          onSelected: (String? value) {
            // This is called when the user selects an item.
            setState(() {
              dropdownValue = value!;
            });
          },
          dropdownMenuEntries: menuEntries,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: CheckboxListTile(
            title: const Text(
              'By checking the box, you agree to Save The Whales privacy policy and user agreement',
              textScaler: TextScaler.linear(0.7),
              ),
            activeColor: Colors.blueAccent,
            hoverColor: Colors.blue,
            checkColor: Colors.white,
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
        
      ],
    );
  }
}

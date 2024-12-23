import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:savethewhales/services/database_service.dart';

import 'table.dart';

const List<String> list = <String>['Visa', 'Credit', 'QRIS'];
typedef MenuEntry = DropdownMenuEntry<String>;

class BillPage extends StatefulWidget {
  const BillPage({super.key});

  @override
  State<BillPage> createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> {
  final DatabaseService _databaseService = DatabaseService.instance;
  final GlobalKey<FormState> _billsFormKey = GlobalKey<FormState>();
  bool isChecked = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            billsform(),
          ],
        ),
      ),
    );
  }

  String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value)
      ? 'Enter a valid email address'
      : null;
  }

  Form billsform() {
    String? selectedvalue;
    String? name;
    String? phone;
    String? email;
    String? nominal;
    String? payment;
    return Form(
      // autovalidateMode: AutovalidateMode.always,
      key: _billsFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
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
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your name',
              ),
              validator: (String? value){
                if(value == null || value.isEmpty){
                  return 'Please enter some text';
                }
                return null;
              },
              onSaved: (newValue) {
                name = newValue;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(12),
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your phone',
              ),
              onSaved: ( newValue) {
                phone = newValue;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your email',
              ),
              validator: validateEmail,
              onSaved: (newValue){
                email = newValue;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your nominal',
              ),
              onSaved: ( newValue) {
                nominal = newValue;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: DropdownButtonFormField<String>(
              value: selectedvalue,
              decoration: const InputDecoration(
                labelText: 'Choose payment',
                border: OutlineInputBorder(),
              ),
              items: list.map((p){
                return DropdownMenuItem<String>(
                  value: p,
                  child: Text(p),
                  );
              }).toList(),
              onChanged: (newvalue){
                setState(() {
                  selectedvalue = newvalue;
                });
              },
              onSaved:(newValue) {
                payment = newValue;
              },
            )
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
          Center(
            child: FilledButton(
              onPressed: (){
                if(_billsFormKey.currentState!.validate() || isChecked){
                  _billsFormKey.currentState!.save();

                  _databaseService.addBill(name!, phone!, email!, nominal!, payment!);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Donation Success!!'
                      )
                    ),
                  );
                  _billsFormKey.currentState!.reset();
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Please fill all fields and agree to the terms.'
                      )
                    ),
                  );
                }
              },
              child: const Text('Donate Now !!'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BillListPage()),
              );
            },
            child: Text('Show Bills'),
          ),
        ],
      )
    );
  }
  Column res(String text){
    return Column(
      children: [
        Text(text)
      ],
    );
  }
}

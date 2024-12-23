import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:savethewhales/services/database_service.dart';

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

  Form billsform() {
    String? selectedvalue;
    String? name;
    String? phone;
    String? email;
    String? payment;
    return Form(
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
                if(value == null || value.isEmpty || value.length < 5){
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
              maxLength: 12,
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
              validator: (String? value){
                return (value != null && value.contains('@')) ? null : 'please insert valid email';
              },
              onSaved: (newValue){
                email = newValue;
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
                if(_billsFormKey.currentState!.validate()){
                  _billsFormKey.currentState!.save();
                }
              },
              child: const Text('Donate Now !!'),
            ),
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

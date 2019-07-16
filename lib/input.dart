import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  State<StatefulWidget> createState() => _InputState();
}

class _InputState extends State<Input> {
  String _name = "";
  String _currency = 'Dollar';
  final _currencies = ['Dollar', 'Euro', 'Pound'];

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: 'Enter Your Name'),
            onChanged: (String val) => setState(() => _name = val),
          ),
          DropdownButton<String>(
            value: _currency,
            items: getItems(),
            onChanged: (String val) => setState(() => _currency = val),
          ),
          Text('Hello ' + _name)
        ],
      ),
    );
  }
  getItems() {
    return _currencies
        .map((String val) =>
            DropdownMenuItem<String>(value: val, child: Text(val)))
        .toList();
  }
}

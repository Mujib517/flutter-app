import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  State<StatefulWidget> createState() => _InputState();
}

class _InputState extends State<Input> {
  String name="";

  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            onChanged: (String val) => setState(() => name = val),
          ),
          Text('Hello ' + name + ' !')
        ],
      ),
    );
  }
}

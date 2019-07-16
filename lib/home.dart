import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Material(
        child: new Center(
            child: Text(
      sayHello(),
      style: TextStyle(
          color: Colors.black,
          fontFamily: 'Oxygen',
          fontSize: 30,
          fontWeight: FontWeight.w300),
    )));
  }

  String sayHello() {
    return "Hello Mujeeb";
  }
}

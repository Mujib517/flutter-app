import 'package:flutter/material.dart';

class About extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            alignment: Alignment.topRight,
            width: 192,
            height: 96,
            child: Text(
              'Pizza',
              style: TextStyle(
                  fontFamily: 'Oxygen',
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            )));
  }
}

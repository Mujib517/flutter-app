import 'package:flutter/material.dart';
import './button.dart';

class About extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            alignment: Alignment.topRight,
            width: 192,
            height: 96,
            child: ButtonWidget()));
  }
}

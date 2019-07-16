import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(
        child: RaisedButton(
            child: Text('Click'),
            elevation: 5,
            color: Colors.lightGreen,
            onPressed: () => onBtnClick(context)));
  }

  void onBtnClick(BuildContext context) {
    var alert = AlertDialog(
        title: Text('Alert'), content: Text('You pressed the button'));
    showDialog(context: context, builder: (BuildContext context) => alert);
  }
}

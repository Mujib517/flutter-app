import 'package:flutter/material.dart';
import './about.dart';

void main() => runApp(new HelloFlutterApp());

class HelloFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Cool App',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text(
                'My Cool Apple',
                style: TextStyle(
                    fontWeight: FontWeight.w300, fontFamily: 'Oxygen'),
              ),
              backgroundColor: Colors.deepOrangeAccent,
            ),
            body: About()));
  }
}

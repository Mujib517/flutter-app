import 'package:flutter/material.dart';

class NewItem extends StatefulWidget {
  State<StatefulWidget> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  Item item = new Item();

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(5),
              child: TextField(
                  onChanged: onNameChange,
                  decoration: InputDecoration(
                      labelText: 'Name of design',
                      hintText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))))),
          Padding(
              padding: EdgeInsets.all(5),
              child: TextField(
                  onChanged: onPriceChange,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Price',
                      hintText: '123',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))))),
          Padding(
              padding: EdgeInsets.all(5),
              child: RaisedButton(child: Text("Save"))),
          Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                  "You entered " + item.name + ", " + item.price.toString()))
        ],
      ),
    );
  }

  void onNameChange(String val) {
    setState(() => item.name = val);
  }

  void onPriceChange(String val) {
    setState(() => item.price = num.parse(val));
  }
}

class Item {
  String name;
  num price;

  Item() {
    name = "";
    price = 0;
  }
}

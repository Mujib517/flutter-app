import 'package:flutter/material.dart';
import 'package:flutter_app/model/todo.dart';

class TodoDetail extends StatefulWidget {
  Todo todo;

  TodoDetail(this.todo);

  State<StatefulWidget> createState() => TodoDetailState(todo);
}

class TodoDetailState extends State<TodoDetail> {
  Todo todo;
  final _priorities = ["High", "Medium", "Low"];

  TodoDetailState(this.todo);

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text(todo.title),
            actions: <Widget>[_simplePopup()]),
        body: Padding(
            padding: EdgeInsets.all(5),
            child: Card(
                elevation: 2,
                child: Column(children: <Widget>[
                  Padding(
                      padding: EdgeInsets.all(5),
                      child: TextFormField(
                        initialValue: todo.title,
                        decoration: InputDecoration(
                            labelText: 'Title',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                      )),
                  Padding(
                      padding: EdgeInsets.all(5),
                      child: TextFormField(
                        initialValue: todo.description,
                        decoration: InputDecoration(
                            labelText: 'Description',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5))),
                      )),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: DropdownButton<String>(
                        value: _priorities[todo.priority],
                        items: _priorities
                            .map((String value) => DropdownMenuItem<String>(
                                value: value, child: Text(value)))
                            .toList(),
                        onChanged: (String val) => debugPrint("done")),
                  )
                ]))));
  }

  Widget _simplePopup() => PopupMenuButton<int>(
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 1,
            child: Text("Back"),
          ),
          PopupMenuItem(
            value: 2,
            child: Text("Delete"),
          ),
        ],
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_app/model/todo.dart';
import 'package:flutter_app/util/dbhelper.dart';

class TodoList extends StatefulWidget {
  State<StatefulWidget> createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  DbHelper dbHelper = DbHelper();
  List<Todo> list = new List<Todo>();
  int count = 0;

  Widget build(BuildContext context) {
    get();
    return Padding(
        padding: EdgeInsets.all(6),
        child: Scaffold(
          body: todoListItems(context),
          floatingActionButton: FloatingActionButton(
              onPressed: null, tooltip: 'Add New', child: new Icon(Icons.add)),
        ));
  }

  ListView todoListItems(BuildContext context) {
    return ListView.builder(
        itemBuilder: (BuildContext context, int position) {
          return Card(
              color: Colors.white,
              elevation: 2,
              child: ListTile(
                  onTap: () => debugPrint('Tapped'),
                  title: Text(this.list[position].title.toString()),
                  subtitle: Text(this.list[position].date),
                  leading: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Text(this.list[position].id.toString()))));
        },
        itemCount: count);
  }

  void get() async {
    await dbHelper.init();
    final result = await dbHelper.get();
    List<Todo> todos = List<Todo>();
    for (int i = 0; i < result.length; i++) {
      todos.add(Todo.fromObject(result[i]));
      debugPrint(todos[i].title);
    }

    setState(() {
      list = todos;
      count = result.length;
    });
  }
}

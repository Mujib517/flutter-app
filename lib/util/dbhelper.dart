import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../model/todo.dart';

class DbHelper {
  String tbl = "Todo";
  String colId = "id";
  String colTitle = "title";
  String colDescription = "description";
  String colPriority = "priority";
  String colDate = "date";
  static Database _db;

  Future<Database> get db async {
    if (_db == null) _db = await init();
    return _db;
  }

  // Singleton
  static final _dbHelper = new DbHelper._internal();

  DbHelper._internal();

  factory DbHelper() {
    return _dbHelper;
  }

  Future<Database> init() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = "todos.db";
    var db = await openDatabase(path, version: 1, onCreate: _createDb);
    return db;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tbl(id INTEGER PRIMARY KEY,title TEXT,priority INTEGER,date TEXT,description TEXT)');
  }

  Future<int> insert(Todo todo) async {
    Database db = await this.db;
    return await db.insert(tbl, todo.toMap());
  }

  Future<List> get() async {
    Database db = await this.db;
    return await db.rawQuery("SELECT * FROM $tbl order by $colPriority ASC");
  }

  Future<int> count() async {
    Database db = await this.db;
    var result = await db.rawQuery("SELECT COUNT(1) FROM $tbl");
    return Sqflite.firstIntValue(result);
  }

  Future<int> update(Todo todo) async {
    var db = await this.db;
    return await db
        .update(tbl, todo.toMap(), where: '$colId=?', whereArgs: [todo.id]);
  }

  Future<int> delete(int id) async {
    var db = await this.db;
    return await db.delete(tbl, where: '$colId=?', whereArgs: [id]);
  }
}

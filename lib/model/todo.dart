class Todo {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  Todo(this._title, this._priority, this._date, this._description);

  Todo.id(this._id, this._title, this._priority, this._date, this._description);

  int get id => _id;

  String get title => _title;

  String get date => _date;

  int get priority => _priority;

  String get description => _description;

  set title(String newTitle) => _title = newTitle;

  set date(String dt) => _date = dt;

  set priority(int pr) => _priority = pr;

  set description(String desc) => _description = desc;

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map["title"] = _title;
    map["description"] = _description;
    map["priority"] = _priority;
    map["date"] = _date;
    if (_id != null) map["id"] = _id;

    return map;
  }

  Todo.fromObject(dynamic obj) {
    _id = obj["id"];
    _title = obj["title"];
    _description = obj["description"];
    _priority = obj["priority"];
    _date = obj["date"];
  }
}

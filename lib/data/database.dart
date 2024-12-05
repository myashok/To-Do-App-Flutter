import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List todoList = [];
  final _myBox = Hive.box('myBox');
  void createInitialData() {
    todoList = [
      ["Do Exercise", false],
      ["Do Yoga", false]
    ];
  }

  void loadData() {
    todoList = _myBox.get("TODOList");
  }

  void updateDataBase() {
    _myBox.put("TODOList", todoList);
  }
}

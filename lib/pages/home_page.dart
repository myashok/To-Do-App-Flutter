// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todo_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ToDoDatabase db = ToDoDatabase();
  final _myBox = Hive.box('myBox');
  @override
  void initState() {
    if (_myBox.get("TODOList") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = value ?? false; // Update the state
    });
    db.updateDataBase();
  }

  final TextEditingController controller = TextEditingController();
  void onSaveTask() {
    setState(() {
      db.todoList.add([controller.text, false]);
      controller.clear();
      Navigator.of(context).pop();
    });
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: controller,
            onSave: onSaveTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TO DO"),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: db.todoList[index][0],
              deleteTask: (context) => deleteTask(index),
              taskCompleted: db.todoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
            );
          },
        ));
  }
}

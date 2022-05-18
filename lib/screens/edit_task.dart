import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/todo.dart';

class EditTaskScreen extends StatefulWidget {
  var task = {};
  EditTaskScreen({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late final task;
  final TextEditingController _taskCtrl = TextEditingController();

  final TodoController _todoController = Get.put(TodoController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      task = widget.task;
    });
    _taskCtrl.text = task["title"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
      ),
      body: Column(children: [
        TextField(
            controller: _taskCtrl,
            onChanged: (val) {
              setState(() {
                task["title"] = _taskCtrl.text;
              });
            }),
        Switch(
          value: task["isCompleted"],
          onChanged: (val) {
            setState(() {
              task["isCompleted"] = val;
            });
          },
        ),
        ElevatedButton(
          onPressed: () {
            _todoController.updateTask(task);
          },
          child: const Text("Update Task"),
        ),
        TextButton(
          onPressed: () {
            _todoController.deleteTask(widget.task["id"]);
          },
          child: const Text("Delete"),
        ),
      ]),
    );
  }
}

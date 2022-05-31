import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/todo.dart';

class AddTaskScreenProvider extends StatelessWidget {
  AddTaskScreenProvider({Key? key}) : super(key: key);

  final TextEditingController _taskCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
      ),
      body: Column(children: [
        TextField(
          controller: _taskCtrl,
        ),
        ElevatedButton(
          onPressed: () {
            Provider.of<TodoProvider>(context, listen: false)
                .addTask(_taskCtrl.text);
          },
          child: const Text("Add Task"),
        ),
      ]),
    );
  }
}

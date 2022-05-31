import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/todo.dart';
import 'package:todoapp/screens/add_task.dart';
import 'package:todoapp/screens/edit_task.dart';
import 'package:todoapp/screens/provider_example/add_task.dart';

class TaskListScreenProvider extends StatelessWidget {
  TaskListScreenProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tasks")),
      body: Consumer<TodoProvider>(
        builder: ((context, todo, child) {
          return ListView.builder(
            itemCount: todo.tasks.length,
            itemBuilder: (bc, index) {
              return ListTile(
                title: Text(todo.tasks[index]),
                onTap: () {
                  // Get.to(EditTaskScreen(task: todo.tasks[index]));
                },
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    Provider.of<TodoProvider>(
                      context,
                      listen: false,
                    ).removeTask(index);
                  },
                ),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.to(AddTaskScreenProvider());
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTaskScreenProvider()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

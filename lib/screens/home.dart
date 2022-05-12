import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/todo.dart';
import 'package:todoapp/screens/add_task.dart';
import 'package:todoapp/screens/album_screen.dart';
import 'package:todoapp/screens/settings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final TodoController _todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tasks"), actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Get.to(AlbumScreen());
          },
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Get.to(AddTaskScreen());
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            Get.to(SettingsScreen());
          },
        )
      ]),
      body: Obx(
        () => ListView.builder(
          itemCount: _todoController.tasks.length,
          itemBuilder: (bc, index) {
            return ListTile(
              title: Text(_todoController.tasks[index]),
            );
          },
        ),
      ),
    );
  }
}

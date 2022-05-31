import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  var tasks = [];

  void addTask(title) {
    tasks.add(title);
    notifyListeners();
  }

  void removeTask(index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}

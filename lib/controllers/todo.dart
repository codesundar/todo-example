import 'package:get/get.dart';

class TodoController extends GetxController {
  List tasks = [].obs;

  void addTask(title){
    tasks.add(title);
  }
}

import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  var count = 0;

  void increaseCount() {
    count = count + 1;
    notifyListeners();
  }
}

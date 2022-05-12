import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  var isDarkModeEnabled = false.obs;

  void switchThemeType() {
    isDarkModeEnabled.value = !isDarkModeEnabled.value;
    isDarkModeEnabled.value ? Get.changeThemeMode(ThemeMode.dark) : Get.changeThemeMode(ThemeMode.light);
    
    print(isDarkModeEnabled.value);
  }
}

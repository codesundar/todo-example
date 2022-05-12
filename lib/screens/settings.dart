import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/settings.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  final SettingsController _settingsCtrl = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(
        children: [
          ListTile(
            title: Text("Dark Mode"),
            trailing: Obx(
              () => Switch(
                onChanged: (val) {
                  _settingsCtrl.switchThemeType();
                },
                value: _settingsCtrl.isDarkModeEnabled.value,
              ),
            ),
          )
        ],
      ),
    );
  }
}

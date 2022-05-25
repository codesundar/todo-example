import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/controllers/profile.dart';
import 'package:todoapp/controllers/settings.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingsController _settingsCtrl = Get.put(SettingsController());

  final ProfileController _profileCtrl = Get.put(ProfileController());

  var _isPushEnabled = false;

  togglePushNotification(val) async {
    if (val) {
      var token = await FirebaseMessaging.instance.getToken();
      print(token);
      await FirebaseMessaging.instance.subscribeToTopic("driver");
      await FirebaseMessaging.instance.subscribeToTopic("all_user");
      _profileCtrl.updateProfile({"pushToken": token});
    } else {
      await FirebaseMessaging.instance.unsubscribeFromTopic("driver");
      await FirebaseMessaging.instance.unsubscribeFromTopic("all_user");
      await FirebaseMessaging.instance.deleteToken();
      _profileCtrl.updateProfile({"pushToken": ""});
    }
    setState(() {
      _isPushEnabled = val;
    });
  }

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
          ),
          ListTile(
            title: Text("Push Notification"),
            trailing: Switch(
              onChanged: (val) {
                togglePushNotification(val);
              },
              value: _isPushEnabled,
            ),
          )
        ],
      ),
    );
  }
}

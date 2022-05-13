import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/screens/home.dart';
import 'package:todoapp/styles/theme-data.dart';

import 'controllers/settings.dart';

import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final SettingsController _settingsCtrl = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    // return Obx(
    //   () => GetMaterialApp(
    //     title: 'Flutter Demo',
    //     theme: CustomThemeData().lightTheme,
    //     darkTheme: CustomThemeData().darkTheme,
    //     themeMode: _settingsCtrl.isDarkModeEnabled.value
    //         ? ThemeMode.dark
    //         : ThemeMode.light,
    //     home: HomeScreen(),
    //   ),
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: CustomThemeData().lightTheme,
      darkTheme: CustomThemeData().darkTheme,
      home: LoginScreen(),
    );
  }
}

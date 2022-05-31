import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/counter.dart';
import 'package:todoapp/providers/todo.dart';
import 'package:todoapp/screens/counter_provider.dart';
import 'package:todoapp/screens/home.dart';
import 'package:todoapp/screens/provider_example/task_list.dart';
import 'package:todoapp/screens/validate.dart';
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
    // return GetMaterialApp(
    //   title: 'Flutter Demo',
    //   theme: CustomThemeData().lightTheme,
    //   darkTheme: CustomThemeData().darkTheme,
    //   home: ValidateScreen(),
    // );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TodoProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: CustomThemeData().lightTheme,
        darkTheme: CustomThemeData().darkTheme,
        home: TaskListScreenProvider(),
      ),
    );
  }
}

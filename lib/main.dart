import 'package:amalportfolio/core/theme/theme.dart';
import 'package:amalportfolio/screens/controllers/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:amalportfolio/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    return Obx(() => GetMaterialApp(
          title: 'amaljose',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeController.theme,
          debugShowCheckedModeBanner: false,
          home: const ScreenHome(),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:amalportfolio/core/colors/appcolors.dart';
import 'package:amalportfolio/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async{
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
    return GetMaterialApp(
      title: 'Amal Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: AppColors.primaryBackground,
        appBarTheme: const AppBarTheme(
            color: AppColors.secondaryBackground,
            foregroundColor: AppColors.textLight),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const ScreenHome(),
    );
  }
}

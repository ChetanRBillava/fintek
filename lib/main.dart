import 'package:fintek/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'core/constants/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appTitle,
      home: SplashScreen(),
    );
  }
}
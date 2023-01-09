import 'package:fintek/presentation/router/app_router.dart';
import 'package:fintek/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'core/constants/strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, constraints, orientation) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appTitle,
        initialRoute: AppRouter.splash,
        onGenerateRoute: AppRouter.onGenerateRoute,
      );
    });
  }
}
import 'package:fintek/presentation/router/app_router.dart';
import 'package:fintek/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'core/constants/strings.dart';
import 'logic/cubit/app_theme_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool setColor = false;

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppThemeCubit(),
        ),
      ],
      child: Sizer(builder: (context, constraints, orientation) {
        if (!setColor) {
          BlocProvider.of<AppThemeCubit>(context).setDarkTheme('auto');
          setColor = true;
        }
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appTitle,
          initialRoute: AppRouter.splash,
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      }),
    );
  }
}
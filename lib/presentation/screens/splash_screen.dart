import 'package:fintek/core/constants/images.dart';
import 'package:fintek/core/constants/strings.dart';
import 'package:fintek/presentation/utils/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/app_theme_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: (appThemeState as AppThemeSet).themeClass.backgroundColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.logo),
                const CircularProgressIndicator(),
                const SizedBox(height: 5),
                const AppTexts(textString: AppStrings.appVersion),
              ],
            ),
          ),
        );
      },
    );
  }
}

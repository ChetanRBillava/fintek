import 'dart:async';

import 'package:fintek/core/constants/images.dart';
import 'package:fintek/core/constants/strings.dart';
import 'package:fintek/presentation/utils/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../logic/cubit/app_theme_cubit.dart';
import '../router/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushNamed(AppRouter.home);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return BlocBuilder<AppThemeCubit, AppThemeState>(
        builder: (context, appThemeState) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: (appThemeState as AppThemeSet).themeClass.backgroundColor,
              body: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        width: constraints.maxWidth > 700 ? 25.w : 70.w,
                        AppImages.logo,
                        fit: BoxFit.fitWidth,
                      ),
                      const CircularProgressIndicator(),
                      const SizedBox(height: 5),
                      AppTexts(
                          textString: AppStrings.appVersion,
                        textFontSize: constraints.maxWidth > 700 ? 4.sp : 10.sp,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}

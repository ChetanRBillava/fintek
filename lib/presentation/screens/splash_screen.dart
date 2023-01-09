import 'package:fintek/core/constants/images.dart';
import 'package:fintek/core/constants/strings.dart';
import 'package:fintek/presentation/utils/app_texts.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
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
  }
}

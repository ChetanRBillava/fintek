import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../logic/cubit/app_theme_cubit.dart';
import '../utils/app_texts.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 700) {
        return const WebLayout();
      }
      else {
        return const AppLayout();
      }
    });
  }
}

class AppLayout extends StatelessWidget {
  const AppLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, themeState) {
        return Padding(
          padding: EdgeInsets.all(4.w),
          child: Container(
            decoration: BoxDecoration(
                color: (themeState as AppThemeSet).themeClass.secondaryColor.withOpacity(0.1)
            ),
            child: Padding(
              padding: EdgeInsets.all(1.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 2.w),
                    child: Icon(
                      Icons.notifications_active,
                      color: themeState.themeClass.textColor_2,
                      size: 20.sp,
                    ),
                  ),
                  SizedBox(
                    width: 80.w,
                    child: AppTexts(
                      textString: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                      textFontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class WebLayout extends StatelessWidget {
  const WebLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, themeState) {
        return Container(
          decoration: BoxDecoration(
              color: (themeState as AppThemeSet).themeClass.secondaryColor
                  .withOpacity(0.1)
          ),
          child: Padding(
            padding: EdgeInsets.all(1.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 2.w),
                  child: Icon(
                    Icons.notifications_active,
                    color: themeState.themeClass.textColor_2,
                  ),
                ),
                SizedBox(
                  width: 25.w,
                  child: AppTexts(
                    textString: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                    textFontSize: 2.sp,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
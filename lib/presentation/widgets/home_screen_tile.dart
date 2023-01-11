import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../logic/cubit/app_theme_cubit.dart';
import '../utils/app_texts.dart';

class HomeTiles extends StatelessWidget {
  const HomeTiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth > 700){
        return BlocBuilder<AppThemeCubit, AppThemeState>(
          builder: (context, themeState) {
            return Padding(
              padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 2.h),
              child: Container(
                decoration: BoxDecoration(
                    color: (themeState as AppThemeSet).themeClass.formFieldBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(0.5.w)),
                  border: Border.all(
                    color: themeState.themeClass.textCaptionColor
                  )
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top:1.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Icon(
                                  Icons.payments,
                                  color: themeState.themeClass.textColor_2,
                                  size: 5.sp,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 1.w),
                                child: AppTexts(
                                    textString: 'Title goes here',
                                  textFontSize: 3.sp,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 2.w),
                            child: AppTexts(
                                textString: '5.0',
                              textFontSize: 3.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3.w, top: 2.h, bottom: 1.h),
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
      else{
        return BlocBuilder<AppThemeCubit, AppThemeState>(
          builder: (context, themeState) {
            return Padding(
              padding: EdgeInsets.only(left: 8.w, right: 8.w, top: 4.h),
              child: Container(
                width: 100.w,
                decoration: BoxDecoration(
                    color: (themeState as AppThemeSet).themeClass.formFieldBackgroundColor,
                    borderRadius: BorderRadius.all(Radius.circular(2.w))
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top:1.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Icon(
                                  Icons.payments,
                                  color: themeState.themeClass.textColor_2,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: const AppTexts(
                                    textString: 'Title goes here'
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 2.w),
                            child: const AppTexts(
                                textString: '5.0'
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3.w, top: 2.h, bottom: 1.h),
                      child: AppTexts(
                        textString: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                        textFontSize: 9.sp,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    });
  }
}
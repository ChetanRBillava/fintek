import 'package:fintek/logic/cubit/app_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/images.dart';
import '../utils/app_texts.dart';
import '../widgets/home_screen_tile.dart';
import '../widgets/notification_tile.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth>700){
        return const WebLayout();
      }
      else{
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
        return Scaffold(
            body: Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const AssetImage(AppImages.bg),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          (themeState as AppThemeSet).themeClass.backgroundColor,
                          BlendMode.softLight
                      )
                  )
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 4.w, top: 5.h),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: themeState.themeClass.secondaryColor.withOpacity(0.15),
                                  shape: BoxShape.circle
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2.w),
                                child: Icon(
                                  Icons.arrow_back_rounded,
                                  color: themeState.themeClass.textColor_1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i){
                          return const NotificationTile();
                        }
                    ),
                  ],
                ),
              ),
            )
        );
      },
    );
  }
}

class WebLayout extends StatefulWidget {
  const WebLayout({Key? key}) : super(key: key);

  @override
  State<WebLayout> createState() => _WebLayoutState();
}

class _WebLayoutState extends State<WebLayout> {
  int currentIndex = 0;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController = ScrollController(initialScrollOffset: 50.0);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, themeState) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const AssetImage(AppImages.bg),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          (themeState as AppThemeSet).themeClass.backgroundColor,
                          BlendMode.softLight
                      )
                  )
              ),
              child: Row(
                children: [
                  ///sidebar
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: themeState.themeClass.secondaryColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.sp),
                              child: Icon(
                                Icons.dynamic_feed_sharp,
                                size: 7.sp,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.sp, top: 6.h),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.home,
                                  size: 7.sp,
                                  color: themeState.themeClass.textColor_2,
                                ),
                                SizedBox(height: 2.sp),
                                AppTexts(
                                  textString: 'Home',
                                  textFontSize: 3.sp,
                                  textColor: themeState.themeClass.textColor_2,
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.sp, top: 6.h),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.settings,
                                  size: 7.sp,
                                  color: themeState.themeClass.textColor_1,
                                ),
                                SizedBox(height: 2.sp),
                                AppTexts(
                                  textString: 'Settings',
                                  textFontSize: 3.sp,
                                  textColor: themeState.themeClass.textColor_1,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2.sp, bottom: 6.h),
                        child: Column(
                          children: [
                            Icon(
                              Icons.logout,
                              size: 7.sp,
                              color: themeState.themeClass.textColor_1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ///Mid
                  SizedBox(
                    width: 60.w,
                    child: Padding(
                      padding: EdgeInsets.only(top: 5.h, left: 2.w),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                AppTexts(
                                  textString: 'HOME > DETAILS',
                                  textFontSize: 2.sp,
                                  textColor: themeState.themeClass.textColor_1,
                                ),
                              ],
                            ),
                            SizedBox(height: 2.h,),
                            Container(
                              decoration: BoxDecoration(
                                  color: themeState.themeClass.secondaryColor.withOpacity(0.1)
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(1.h),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 2.w, bottom: 1.h),
                                          child: AppTexts(
                                            textString: 'TITLE',
                                            textFontSize: 3.sp,
                                            fontWeight: FontWeight.bold,
                                            textColor: themeState.themeClass.textColor_1,
                                          ),
                                        ),
                                      ],
                                    ),

                                    ///sub header
                                    Padding(
                                      padding: EdgeInsets.only(left: 1.w, top: 2.h),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                              left: BorderSide(
                                                  color: themeState.themeClass.textColor_2,
                                                  width: 2.sp
                                              )
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            ///scores
                                            Padding(
                                              padding: EdgeInsets.only(left: 5.w, right: 2.w),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      AppTexts(
                                                        textString: '14552',
                                                        textFontSize: 3.sp,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                      SizedBox(height: 1.h),
                                                      AppTexts(
                                                        textString: 'SCORE',
                                                        textFontSize: 2.sp,
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: (7.sp + 1.h),
                                                    width: 1.sp,
                                                    decoration: BoxDecoration(
                                                        color: themeState.themeClass.textCaptionColor
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      AppTexts(
                                                        textString: '14552',
                                                        textFontSize: 3.sp,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                      SizedBox(height: 1.h),
                                                      AppTexts(
                                                        textString: 'SCORE',
                                                        textFontSize: 2.sp,
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: (7.sp + 1.h),
                                                    width: 1.sp,
                                                    decoration: BoxDecoration(
                                                        color: themeState.themeClass.textCaptionColor
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      AppTexts(
                                                        textString: '14552',
                                                        textFontSize: 3.sp,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                      SizedBox(height: 1.h),
                                                      AppTexts(
                                                        textString: 'SCORE',
                                                        textFontSize: 2.sp,
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: (7.sp + 1.h),
                                                    width: 1.sp,
                                                    decoration: BoxDecoration(
                                                        color: themeState.themeClass.textCaptionColor
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      AppTexts(
                                                        textString: '14552',
                                                        textFontSize: 3.sp,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                      SizedBox(height: 1.h),
                                                      AppTexts(
                                                        textString: 'SCORE',
                                                        textFontSize: 2.sp,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 5.h),
                                            Padding(
                                              padding: EdgeInsets.only(left: 3.w, bottom: 1.h),
                                              child: AppTexts(
                                                textString: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                                                textFontSize: 2.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    ///Tiles
                                    for(int i=0; i<10; i++)
                                      const HomeTiles(),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  ///notifications
                  Padding(
                    padding: EdgeInsets.only(top: 3.h, left: 2.w),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            width: 30.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppTexts(
                                  textString: 'NOTIFICATIONS',
                                  textFontSize: 3.5.sp,
                                  textColor: themeState.themeClass.textColor_1,
                                  fontWeight: FontWeight.bold,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: themeState.themeClass.secondaryColor,
                                        shape: BoxShape.circle
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(1.sp),
                                      child: Icon(
                                        Icons.close,
                                        size: 3.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.h,),
                          for(int i=0; i<10; i++)
                            const NotificationTile(),
                        ],
                      ),
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

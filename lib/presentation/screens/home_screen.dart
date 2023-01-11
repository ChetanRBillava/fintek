import 'package:fintek/logic/cubit/app_theme_cubit.dart';
import 'package:fintek/presentation/utils/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/images.dart';
import '../../presentation/utils/custom_print.dart';
import '../router/app_router.dart';
import '../widgets/home_screen_tile.dart';
import '../widgets/notification_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(constraints.maxWidth>700){
        return const WebLayout();
      }
      else{
        return const MobileLayout();
      }
    });
  }
}

class MobileLayout extends StatefulWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppThemeCubit, AppThemeState>(
      builder: (context, themeState) {
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              backgroundColor: (themeState as AppThemeSet).themeClass.appbarBackgroundColor,
              selectedItemColor: themeState.themeClass.textColor_2,
              unselectedItemColor: themeState.themeClass.textColor_1,
              onTap: (newIndex){
                customPrint.myCustomPrint(newIndex);
                setState(() {
                  currentIndex = newIndex;
                });
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home,),
                    label: 'Home'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings,),
                    label: 'Settings'
                ),
              ],
            ),
            body: Container(
              height: 100.h,
              width: 100.w,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: const AssetImage(AppImages.bg),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          themeState.themeClass.backgroundColor,
                          BlendMode.softLight
                      )
                  )
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ///header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8.w, top: 5.h),
                          child: Container(
                            decoration: BoxDecoration(
                                color: themeState.themeClass.secondaryColor,
                                borderRadius: BorderRadius.all(Radius.circular(3.w))
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(2.w),
                              child: Icon(
                                Icons.dynamic_feed_sharp,
                                size: 30.sp,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 8.w, top: 5.h),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.of(context).pushNamed(AppRouter.notifications);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: themeState.themeClass.secondaryColor.withOpacity(0.15),
                                  shape: BoxShape.circle
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(2.w),
                                child: Icon(
                                  Icons.notifications_sharp,
                                  color: themeState.themeClass.textColor_1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    ///sub header
                    Padding(
                      padding: EdgeInsets.only(left: 8.w, right: 8.w),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: themeState.themeClass.textColor_2,
                                  width: 2.w
                              )
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Column(
                            children: [
                              ///scores
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppTexts(
                                        textString: '14552',
                                        textFontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      SizedBox(height: 1.h),
                                      const AppTexts(
                                        textString: 'SCORE',
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: (30.sp + 3.h),
                                    width: 0.5.w,
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
                                        textFontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      SizedBox(height: 1.h),
                                      const AppTexts(
                                        textString: 'SCORE',
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: (30.sp + 3.h),
                                    width: 0.5.w,
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
                                        textFontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      SizedBox(height: 1.h),
                                      const AppTexts(
                                        textString: 'SCORE',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 5.h),
                              const AppTexts(
                                textString: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ///Tiles
                    ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i){
                          return const HomeTiles();
                        }
                    ),

                  ],
                ),
              ),
            ),
          ),
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
                  ///Tiles
                  SizedBox(
                    width: 95.w,
                    child: Padding(
                      padding: EdgeInsets.only(top: 5.h, left: 2.w),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).pushNamed(AppRouter.notifications);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: themeState.themeClass.secondaryColor,
                                        shape: BoxShape.circle
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(1.sp),
                                      child: Icon(
                                        Icons.notifications,
                                        size: 4.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}



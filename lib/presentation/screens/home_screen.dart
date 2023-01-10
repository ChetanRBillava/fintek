import 'package:fintek/logic/cubit/app_theme_cubit.dart';
import 'package:fintek/presentation/utils/app_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/images.dart';
import '../../presentation/utils/custom_print.dart';
import '../widgets/home_screen_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
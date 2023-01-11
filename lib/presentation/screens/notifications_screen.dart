import 'package:fintek/logic/cubit/app_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../core/constants/images.dart';
import '../widgets/notification_tile.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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

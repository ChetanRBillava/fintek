import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/themes/app_theme.dart';
import '../../presentation/utils/custom_print.dart';

part 'app_theme_state.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(const AppThemeInitial(
      brightness: Brightness.light, themeSetting: 'Auto Switching activated'));

  Future<Color> getColor(context, String color) async{
    if(color == 'text1'){
      return (state as AppThemeSet).themeClass.textColor_1;
    }
    else if(color == 'success'){
      return (state as AppThemeSet).themeClass.successColor;
    }
    else{
      return Colors.transparent;
    }
  }

  void setDarkTheme(String themeSetting) {
    String temp = '';
    if (themeSetting == 'light') {
      temp = 'Light mode only activated';
    }
    else if (themeSetting == 'dark') {
      temp = 'Dark mode only activated';
    }
    else {
      temp = 'Auto Switching activated';
    }
    DarkTheme darkTheme = DarkTheme();
    customPrint.myCustomPrint(temp);
    customPrint.myCustomPrint('Dark mode');

    emit(AppThemeSet(brightness: Brightness.dark,
        themeClass: darkTheme,
        themeSetting: temp));
  }
}

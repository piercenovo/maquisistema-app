import 'package:flutter/material.dart';
import 'package:maquisistema_app/core/constants/colors.dart';
import 'package:maquisistema_app/core/theme/widgets/text_theme.dart';

ThemeData theme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.greyLight,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.black),
      titleTextStyle: TextStyle(
          color: AppColors.black, fontSize: 20, fontWeight: FontWeight.w500),
    ),
    textTheme: MyTextTheme().theme(),
    fontFamily: 'Mulish',
    scaffoldBackgroundColor: AppColors.white,
  );
}

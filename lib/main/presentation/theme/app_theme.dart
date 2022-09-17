import 'package:code_union_test/core/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  ThemeData get defaultTheme => ThemeData(
        scaffoldBackgroundColor: AppColors.greyBackground,
        // bottomAppBarColor: AppColors.snow,
        backgroundColor: AppColors.greyLight,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: AppColors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.black),
          titleTextStyle: AppStyles.headlineMedium,
          titleSpacing: 0,
        ),
        fontFamily: AppStyles.fontFamily,
        // inputDecorationTheme: const InputDecorationTheme(
        //   hintStyle: TextStyle(color: AppColors.black),
        //   labelStyle: TextStyle(color: AppColors.black),
        //   errorStyle: TextStyle(color: AppColors.lightRed),
        // ),

        textTheme: const TextTheme(
          // Headlines
          headlineLarge: AppStyles.headlineLarge,
          headlineMedium: AppStyles.headlineMedium,
          headlineSmall: AppStyles.headlineSmall,
          // Titles
          titleLarge: AppStyles.titleLarge,
          titleMedium: AppStyles.titleMedium,
          titleSmall: AppStyles.titleSmall,
          // Labels
          labelLarge: AppStyles.labelLarge,
          labelMedium: AppStyles.labelMedium,
          labelSmall: AppStyles.labelSmall,
          // Bodies
          bodyLarge: AppStyles.bodyLarge,
          bodyMedium: AppStyles.bodyMedium,
          bodySmall: AppStyles.bodySmall,
          // Displays
          displayLarge: AppStyles.bodyLarge,
          displayMedium: AppStyles.bodyMedium,
          displaySmall: AppStyles.bodySmall,
        ).apply(
          bodyColor: AppColors.black,
          displayColor: AppColors.black,
        ),
        tabBarTheme: TabBarTheme(
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: AppColors.black,
          labelStyle: AppStyles.bodyLarge,
          unselectedLabelStyle: AppStyles.bodyLarge.copyWith(fontWeight: FontWeight.w400),
          labelPadding: EdgeInsets.zero,
        ),
        cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
          primaryColor: AppColors.black,
          scaffoldBackgroundColor: AppColors.greyLight,
          brightness: Brightness.light,
          textTheme: CupertinoTextThemeData(
            primaryColor: AppColors.black,
            textStyle: TextStyle(fontFamily: AppStyles.fontFamily, color: AppColors.black, fontSize: 16),
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.blue, size: 24),
        primaryColor: AppColors.blue,
        brightness: Brightness.light,
        canvasColor: AppColors.greyLight,
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
      );
}

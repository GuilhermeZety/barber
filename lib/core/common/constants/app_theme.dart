import 'package:barber/core/common/constants/app_colors.dart';
import 'package:barber/core/common/extensions/color_extension.dart';
import 'package:flutter/material.dart';

/// > A class that contains all the colors used in the app
class AppTheme {
  static ThemeData get dark => ThemeData(
        fontFamily: 'RobotoSlab',
        primarySwatch: AppColors.primary.toMaterialColor(),
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: AppColors.primary,
          cursorColor: AppColors.primary,
          selectionColor: AppColors.primary.withOpacity(0.2),
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(color: AppColors.grey, letterSpacing: 0.4),
          displayMedium: TextStyle(color: AppColors.grey, letterSpacing: 0.4),
          bodyMedium: TextStyle(color: AppColors.grey, letterSpacing: 0.4),
          titleMedium: TextStyle(color: AppColors.grey, letterSpacing: 0.4),
        ),
      ).copyWith(
        scaffoldBackgroundColor: AppColors.background,
        canvasColor: AppColors.primary,
        primaryColor: AppColors.primary,
        colorScheme: const ColorScheme.dark().copyWith(
          secondary: AppColors.primary,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.inputs,
          isDense: false,
          prefixIconColor: AppColors.grey_hard,
          labelStyle: const TextStyle(
            color: AppColors.grey_hard,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          hintStyle: TextStyle(
            color: AppColors.grey_hard.withOpacity(0.3),
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              color: AppColors.shape.withOpacity(0.3),
            ),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.shape,
              width: 0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              color: AppColors.shape.withOpacity(0.3),
            ),
          ),
          //DISABLE  ------
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0,
              color: AppColors.shape.withOpacity(0.3),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          //ERROR  ------
          errorStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.red,
            ),
          ),

          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.red),
          ),
        ),
      );
}

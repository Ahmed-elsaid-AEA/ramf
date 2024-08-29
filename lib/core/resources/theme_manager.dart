import 'package:flutter/material.dart';
import 'package:ramf2_app/core/resources/colors_manager.dart';
import 'package:ramf2_app/core/resources/fonts_manager.dart';
import 'package:ramf2_app/core/resources/text_style_manager.dart';
class ThemeManager {
  static ThemeData arabicThemeData = ThemeData(
      scaffoldBackgroundColor: ColorsManager.kWhiteColor,
      //text theme
      textTheme: TextTheme(
          bodySmall: TextStyleManager.bodySmall,
          bodyMedium: TextStyleManager.bodyMedium,
          displayMedium: TextStyleManager.displayMedium,
          bodyLarge: TextStyleManager.bodyLarge,
          displayLarge: TextStyleManager.displayLarge),

      //buttons theme
      //   them
      buttonTheme: const ButtonThemeData(
        height: 40,
        buttonColor: ColorsManager.kPrimaryColor,
      ));
  static ThemeData englishThemeData = ThemeData(

      scaffoldBackgroundColor: ColorsManager.kWhiteColor,
      //font family
      fontFamily: FontsManager.fontArabicGEDinerOne,
      //text theme
      textTheme: TextTheme(
          bodySmall: TextStyleManager.bodySmall,

          bodyMedium: TextStyleManager.bodyMedium,
          displayMedium: TextStyleManager.displayMedium,
          bodyLarge: TextStyleManager.bodyLarge,
          displayLarge: TextStyleManager.displayLarge),

      //buttons theme
      //   them
      buttonTheme: const ButtonThemeData(
        height: 40,
        buttonColor: ColorsManager.kPrimaryColor,
      ));
}

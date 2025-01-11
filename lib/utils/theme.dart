import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lance/utils/colors.dart';
import 'package:lance/utils/constants.dart';
import 'package:lance/utils/material_color.dart';

class LanceThemes {
  static ThemeData defaultTheme = ThemeData(
    useMaterial3: false,
    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.light,
    ),
    // primaryColor: LanceColors.red3,
    radioTheme:  RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
      if (states.contains(WidgetState.focused)) {
        return LanceColors.primaryColor;
      }
      return LanceColors.gray4Color;
    }),
  ),
    cardTheme: const CardTheme(
      margin: EdgeInsets.symmetric(vertical: 1.0),
      elevation: 0,
    ),
    buttonTheme: const ButtonThemeData(
      height: 50.0,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      titleLarge: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w700,
        color: LanceColors.darkBlackColor,
        letterSpacing: -0.67,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: LanceColors.darkBlackColor,
      ),
      bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: LanceColors.textColor,
          letterSpacing: 0.3),
      titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: LanceColors.primaryColor,
          letterSpacing: 0.3),
      headlineMedium: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.w700,
        color: LanceColors.darkBlackColor,
        letterSpacing: -0.67,
      ),
      displaySmall: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.w700,
        color: LanceColors.darkBlackColor,
      ),
    ),
    fontFamily: pretendardFonts,
    primarySwatch: createMaterialColor(LanceColors.primaryColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: LanceColors.primaryColor,
      disabledForegroundColor: LanceColors.primaryColor.withOpacity(0.38),
      disabledBackgroundColor: LanceColors.primaryColor.withOpacity(0.12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    )),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      toolbarTextStyle: TextStyle(
        fontSize: 16.0,
        color: LanceColors.blackColor,
        fontWeight: FontWeight.w600,
      ),
      titleTextStyle: TextStyle(
        fontSize: 16.0,
        color: LanceColors.blackColor,
        fontWeight: FontWeight.w600,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      isCollapsed: false,
      fillColor: LanceColors.whiteColor,
      isDense: false,
      hintStyle: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      contentPadding: EdgeInsets.symmetric(vertical: 22, horizontal: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(color: LanceColors.borderColor),
      ),
    
      // focusedBorder: OutlineInputBorder(
      //   borderSide: BorderSide(color: LanceColors.primaryColor, width: 1.0),
      //   borderRadius: BorderRadius.all(
      //     Radius.circular(16),
      //   ),
      // ),
      // enabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.all(
      //     Radius.circular(16),
      //   ),
      //   borderSide: BorderSide(color: LanceColors.borderColor, width: 1.0),
      // ),
      // errorBorder: OutlineInputBorder(
      //   borderSide: BorderSide(color: LanceColors.redColor, width: 1),
      //   borderRadius: BorderRadius.all(
      //     Radius.circular(16),
      //   ),
      // ),
    ),
  );
  static const OutlineInputBorder errorBorder = OutlineInputBorder(
    // borderSide: BorderSide(color: LanceColors.redColor, width: 1),

    borderRadius: BorderRadius.zero,
  );
}

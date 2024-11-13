import 'package:amalportfolio/core/colors/appcolors.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColorsLight.primaryBackground,
  primaryColor: AppColorsLight.secondaryBackground,
  primaryColorDark: AppColorsLight.borderLight,
  highlightColor: AppColorsLight.textDark,
  cardColor: AppColorsLight.secondaryBackground,
  textTheme: TextTheme(
    titleSmall: TextStyle(
        fontSize: 15,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        color: AppColorsLight.textDark),
    headlineSmall: TextStyle(
        fontSize: 15,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        color: AppColorsLight.hoverActiveState),
    bodySmall: TextStyle(
        fontSize: 15,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        color: AppColorsLight.textDark),
  ),
  iconTheme: IconThemeData(color: AppColorsLight.borderLight),
  iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
    overlayColor: WidgetStatePropertyAll(AppColorsLight.borderLight),
    iconColor: WidgetStatePropertyAll(Color(0xFF2A2A2A)),
  )),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColorsLight.accentOrange),
          foregroundColor:
              WidgetStatePropertyAll(AppColorsLight.primaryBackground),
          overlayColor:
              WidgetStatePropertyAll(AppColorsLight.hoverActiveState))),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(AppColorsLight.textGray),
          overlayColor: WidgetStatePropertyAll(AppColorsLight.borderLight),
          side: WidgetStatePropertyAll(
              BorderSide(color: AppColorsLight.borderLight, width: 1.5)))),
  dividerTheme:
      DividerThemeData(color: AppColorsLight.borderLight, thickness: 1.5),
  tabBarTheme: TabBarTheme(
      dividerColor: Colors.transparent,
      indicator: BoxDecoration(
        color: AppColorsLight.hoverActiveState,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      unselectedLabelColor: AppColorsLight.textGray,
      overlayColor: const WidgetStatePropertyAll(AppColorsLight.borderLight)),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColorsLight.borderLight,
  ),
);

///////////////////////////////////////////////////////////////////////////////////////////

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.primaryBackground,
    primaryColor: AppColors.secondaryBackground,
    primaryColorDark: AppColors.borderLight,
    textTheme: TextTheme(
      titleSmall: TextStyle(
          fontSize: 15,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: AppColors.textLight),
      headlineSmall: TextStyle(
          fontSize: 15,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          color: AppColors.hoverActiveState),
    ),
    cardColor: AppColors.secondaryBackground,
    dividerColor: AppColors.borderLight,
    highlightColor: AppColors.textLight,
    iconTheme: IconThemeData(color: AppColors.borderLight),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
      iconColor: WidgetStatePropertyAll(AppColors.textLight),
      overlayColor: WidgetStatePropertyAll(AppColors.borderLight),
    )),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(AppColors.accentOrange),
            foregroundColor: WidgetStatePropertyAll(AppColors.textLight),
            overlayColor: WidgetStatePropertyAll(AppColors.hoverActiveState))),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(AppColors.textGray),
            overlayColor: WidgetStatePropertyAll(AppColors.borderLight),
            side: WidgetStatePropertyAll(
                BorderSide(color: AppColors.borderLight, width: 1.5)))),
    tabBarTheme: TabBarTheme(
        dividerColor: Colors.transparent,
        indicator: BoxDecoration(
          color: AppColors.hoverActiveState,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        unselectedLabelColor: AppColors.textGray,
        overlayColor: const WidgetStatePropertyAll(AppColors.borderLight)),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.secondaryBackground,
        hoverColor: AppColors.borderLight),
    dividerTheme:
        DividerThemeData(color: AppColors.borderLight, thickness: 1.5));

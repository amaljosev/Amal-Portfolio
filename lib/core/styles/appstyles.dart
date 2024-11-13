import 'package:flutter/material.dart';
import 'package:amalportfolio/core/colors/appcolors.dart';

class Appstyles {
  static const appbarTextStyle = TextStyle(
      fontSize: 15,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      color: AppColors.textLight);
  static const appbarHoverTextStyle = TextStyle(
      fontSize: 15,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      color: AppColors.accentOrange);

  static const drawerTextStyle = TextStyle(
      fontSize: 15,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      color: AppColors.textLight);

  static TextStyle headline(BuildContext context, double fontSize) {
    return TextStyle(
      fontSize: MediaQuery.of(context).size.width * fontSize,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      color: AppColors.textLight,
    );
  }

  static TextStyle mainHeadline(
      {required BuildContext context,
      required double fontSize,
      required Color? color}) {
    return TextStyle(
      fontSize: MediaQuery.of(context).size.width * fontSize,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      wordSpacing: 10,
      color: color,
    );
  }

  static TextStyle subHeadline(
      {required BuildContext context, required double fontSize}) {
    return TextStyle(
      fontSize: MediaQuery.of(context).size.width * fontSize,
      fontWeight: FontWeight.bold,
      fontFamily: 'Poppins',
      color: AppColors.hoverActiveState,
    );
  }

  static TextStyle content(
      {required BuildContext context, required double fontSize}) {
    return TextStyle(
      fontSize: MediaQuery.of(context).size.width * fontSize,
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
      color:Theme.of(context).highlightColor,
    );
  }

  static TextStyle bodyText(
      {required BuildContext context,
      Color? color = AppColors.textLight,
      double fontSize = 0.01}) {
    return TextStyle(
      fontSize: MediaQuery.of(context).size.width * fontSize,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle textfieldHintStyle(
      {required BuildContext context, required double fontSize}) {
    return TextStyle(
      fontSize: MediaQuery.of(context).size.width * fontSize,
      fontFamily: 'Poppins',
      color: AppColors.hoverActiveState,
    );
  }
}

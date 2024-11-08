import 'package:flutter/material.dart';
import 'package:amalportfolio/core/colors/appcolors.dart';

class MyElevationButton extends StatelessWidget {
  const MyElevationButton({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accentOrange,
          foregroundColor: AppColors.textLight,
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}

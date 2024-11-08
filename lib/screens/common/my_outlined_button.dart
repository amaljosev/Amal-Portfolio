import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:amalportfolio/core/colors/appcolors.dart';

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton(
      {super.key,
      required this.title,
      this.onPressed,
      this.icon,
      this.padding = 18});
  final String title;
  final IconData? icon;
  final void Function()? onPressed;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      label: Text(title),
      icon: FaIcon(icon),
      style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.textGray,
          side: const BorderSide(color: AppColors.textGray),
          shape: const ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }
}

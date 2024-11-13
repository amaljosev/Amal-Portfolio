import 'package:amalportfolio/core/colors/appcolors.dart';
import 'package:amalportfolio/screens/controllers/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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
    final HomeController homeCtrl = Get.find();
    return Obx(
      () => MouseRegion(
        onEnter: (event) => homeCtrl.isHoverOutlinedButton.value = true,
        onExit: (event) => homeCtrl.isHoverOutlinedButton.value = false,
        child: OutlinedButton.icon(
          onPressed: onPressed,
          label: Text(title,
              style: homeCtrl.isHoverOutlinedButton.value
                  ? TextStyle(color: AppColors.hoverActiveState)
                  : null),
          icon: FaIcon(icon,
              color: homeCtrl.isHoverOutlinedButton.value
                  ? AppColors.hoverActiveState
                  : null),
          style: OutlinedButton.styleFrom(
              shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)))),
        ),
      ),
    );
  }
}

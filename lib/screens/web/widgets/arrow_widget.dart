import 'package:flutter/material.dart';
import 'package:amalportfolio/core/colors/appcolors.dart';

class ArrowWidget extends StatelessWidget {
  const ArrowWidget({super.key, this.onTap, required this.isLeft});
  final void Function()? onTap;
  final bool isLeft;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: AppColors.borderLight,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Center(
        child: Icon(
          isLeft ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
          color: AppColors.textLight,
        ),
      ),
    );
  }
}

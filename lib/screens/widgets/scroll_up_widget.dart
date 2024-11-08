import 'package:flutter/material.dart';
import 'package:amalportfolio/core/colors/appcolors.dart';
import 'package:amalportfolio/screens/controllers/home_controller/home_controller.dart';

class ScrollUpWidget extends StatelessWidget {
  const ScrollUpWidget({
    super.key,
    required this.homeCtrl,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final HomeController homeCtrl;
  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Scroll to top',
      backgroundColor: AppColors.secondaryBackground,
      hoverColor: AppColors.borderLight,
      onPressed: () => homeCtrl.menuScroll(
          duration: 1000,
          pixel: _scrollController.position.minScrollExtent,
          scrollController: _scrollController),
      child: const Icon(
        Icons.keyboard_arrow_up_outlined,
        color: AppColors.textLight,
      ),
    );
  }
}

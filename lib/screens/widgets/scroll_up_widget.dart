import 'package:amalportfolio/core/colors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:amalportfolio/screens/controllers/home_controller/home_controller.dart';
import 'package:get/get.dart';

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
    return Obx(() => MouseRegion(
          onEnter: (event) => homeCtrl.isHoverFloatingActionButton.value = true,
          onExit: (event) => homeCtrl.isHoverFloatingActionButton.value = false,
          child: FloatingActionButton(
            tooltip: 'Scroll to top',
            onPressed: () => homeCtrl.menuScroll(
                duration: 1000,
                pixel: _scrollController.position.minScrollExtent,
                scrollController: _scrollController),
            child: Icon(
              Icons.keyboard_arrow_up_outlined,
              color: homeCtrl.isHoverFloatingActionButton.value
                  ? AppColors.hoverActiveState
                  : null,
            ),
          ),
        ));
  }
}

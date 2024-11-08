import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amalportfolio/core/colors/appcolors.dart';
import 'package:amalportfolio/core/constants/constants.dart';
import 'package:amalportfolio/core/styles/appstyles.dart';
import 'package:amalportfolio/screens/controllers/home_controller/home_controller.dart';
import 'package:amalportfolio/screens/common/my_elevated_button.dart';

class WebAppbar extends StatelessWidget {
  const WebAppbar(
      {super.key,
      required this.controller,
      required this.size,
      required this.myPlatformHeight});
  final ScrollController controller;
  final List myPlatformHeight;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.put(HomeController());
    return Obx(() => AppBar(
          backgroundColor: AppColors.secondaryBackground,
          foregroundColor: AppColors.textLight,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Flexible(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      homeCtrl.menu.length,
                      (index) => MouseRegion(
                        onEnter: (event) => homeCtrl.isHoverd[index] = true,
                        onExit: (event) => homeCtrl.isHoverd[index] = false,
                        child: TextButton(
                          child: Text(homeCtrl.menu[index].title,
                              style: homeCtrl.isHoverd[index]
                                  ? Appstyles.appbarHoverTextStyle
                                  : homeCtrl.menu[index].style),
                          onPressed: () {
                            if (index == homeCtrl.menu.length - 1) {
                              homeCtrl.menuScroll(
                                duration: 1000,
                                scrollController: controller,
                                pixel:
                                    controller.position.maxScrollExtent + 1000,
                              );
                            } else {
                              homeCtrl.scrollToSection(
                                index: index,
                                scrollController: controller,
                                pixel: size.width * myPlatformHeight[index],
                              );
                            }
                          },
                        ),
                      ),
                    )),
              ),
              MyElevationButton(
                  title: 'Hire Me', onPressed: () => homeCtrl.openMail()),
              Appconstants.smallWidth
            ],
          ),
        ));
  }
}

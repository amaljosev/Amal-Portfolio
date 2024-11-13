import 'package:amalportfolio/core/constants/constants.dart';
import 'package:amalportfolio/screens/controllers/theme/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amalportfolio/screens/controllers/home_controller/home_controller.dart';

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
    final themeController = Get.find<ThemeController>();
    return Obx(() => AppBar(
          backgroundColor: Theme.of(context).primaryColor,
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
                              style: homeCtrl.isHoverd[index] ||
                                      homeCtrl.menu[index].isActive.value
                                  ? Theme.of(context).textTheme.headlineSmall
                                  : Theme.of(context).textTheme.titleSmall),
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
              IconButton(
                  icon: Icon(
                    themeController.isDarkMode.value
                        ? Icons.dark_mode
                        : Icons.light_mode,
                  ),
                  onPressed: () => themeController.toggleTheme()),
              Appconstants.smallWidth
            ],
          ),
        ));
  }
}

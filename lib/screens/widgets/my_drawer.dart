import 'package:amalportfolio/core/font/font_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amalportfolio/core/colors/appcolors.dart';
import 'package:amalportfolio/core/styles/appstyles.dart';
import 'package:amalportfolio/screens/controllers/home_controller/home_controller.dart';

class MyDrawerWidget extends StatelessWidget {
  const MyDrawerWidget({
    super.key,
    required this.controller,
    required this.size,
    required this.myPlatformHeight,
  });
  final ScrollController controller;
  final Size size;
  final List myPlatformHeight;
  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.put(HomeController());
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Row(
              children: [
                Text(
                  'Amal Jose',
                  style: TextStyle(
                    color: AppColors.accentOrange,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
              child: ListView(
            children: List.generate(
                homeCtrl.menu.length,
                (index) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        title: Text(
                          homeCtrl.menu[index].title,
                          style: Appstyles.content(
                              context: context,
                              fontSize: FontSize.mobcontentSize),
                        ),
                        hoverColor: Theme.of(context).primaryColorDark,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        onTap: () {
                          homeCtrl.scrollToSection(
                            index: index,
                            scrollController: controller,
                            pixel: size.width * myPlatformHeight[index],
                          );
                          Get.back();
                        },
                      ),
                    )),
          ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amalportfolio/core/colors/appcolors.dart';
import 'package:amalportfolio/core/styles/appstyles.dart';
import 'package:amalportfolio/screens/controllers/home_controller/home_controller.dart';
import 'package:amalportfolio/screens/widgets/social_widget.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget(
      {super.key,
      required this.size,
      required this.fontSize,
      required this.scrollController,
      this.emailOnTap,
      this.numberOnTap,
      required this.myPlatformHeight});

  final Size size;
  final double fontSize;
  final ScrollController scrollController;
  final void Function()? emailOnTap;
  final void Function()? numberOnTap;
  final List myPlatformHeight;

  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.find<HomeController>();
    return Container(
      width: size.width,
      color: AppColors.secondaryBackground,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Amal Jose',
              style:
                  Appstyles.subHeadline(context: context, fontSize: fontSize)),
          Wrap(
            alignment: WrapAlignment.center,
            children: List.generate(
                homeCtrl.menu.length,
                (index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: TextButton(
                        onPressed: () {
                          if (index == homeCtrl.menu.length - 1) {
                            homeCtrl.menuScroll(
                              duration: 1000,
                              scrollController: scrollController,
                              pixel: scrollController.position.maxScrollExtent +
                                  1000,
                            );
                          } else {
                            homeCtrl.scrollToSection(
                              index: index,
                              scrollController: scrollController,
                              pixel: size.width * myPlatformHeight[index],
                            );
                          }
                        },
                        child: Text(homeCtrl.menu[index].title,
                            style: Appstyles.content(
                                context: context, fontSize: fontSize)),
                      ),
                    )),
          ),
          const SocialWidget(mainAxisAlignment: MainAxisAlignment.center),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              TextButton.icon(
                  onPressed: emailOnTap,
                  icon: const Icon(Icons.mail_outline_rounded,
                      color: AppColors.textGray),
                  label: Text(
                    'amaljvattakkunnel@gmail.com',
                    style:
                        Appstyles.content(context: context, fontSize: fontSize),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
              TextButton.icon(
                  onPressed: numberOnTap,
                  icon: const Icon(Icons.phone_outlined,
                      color: AppColors.textGray),
                  label: Text(
                    '+91 9074040970',
                    style:
                        Appstyles.content(context: context, fontSize: fontSize),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

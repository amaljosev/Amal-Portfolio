import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:amalportfolio/core/colors/appcolors.dart';
import 'package:amalportfolio/screens/controllers/home_controller/home_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget({super.key, required this.mainAxisAlignment});
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.find<HomeController>();

    return Wrap(
      alignment: WrapAlignment.center,
      children: List.generate(
          homeCtrl.social.length,
          (index) => IconButton(
              onPressed: () => openSocial(index, homeCtrl),
              icon: FaIcon(homeCtrl.social[index].icon),
              color: AppColors.textGray,
              hoverColor: AppColors.borderLight)),
    );
  }
}

Future<void> openSocial(int index, HomeController controller) async {
  final url = Uri.parse(controller.social[index].url);
  await launchUrl(url, mode: LaunchMode.externalApplication);
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:amalportfolio/core/styles/appstyles.dart';
import 'package:amalportfolio/screens/common/my_outlined_button.dart';
import 'package:amalportfolio/screens/common/my_text_field.dart';
import 'package:amalportfolio/screens/controllers/home_controller/home_controller.dart';

class ContactMeWidget extends StatelessWidget {
  const ContactMeWidget({
    super.key,
    required this.size,
    required this.hintFontSize,
    required this.fieldWidth,
    this.sendButton,
    required this.spaceWidget,
  });

  final Size size;
  final double hintFontSize;
  final double fieldWidth;
  final Function()? sendButton;
  final Widget spaceWidget;

  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.find<HomeController>();
    return Column(
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            MyTextField(
                isEnable: homeCtrl.isLoading.value ? false : true,
                size: size,
                controller: homeCtrl.nameCtrl,
                title: 'Name',
                maxLines: 1,
                hintFontSize: hintFontSize,
                fieldWidth: fieldWidth),
            MyTextField(
                isEnable: homeCtrl.isLoading.value ? false : true,
                size: size,
                controller: homeCtrl.emailCtrl,
                title: 'Email',
                maxLines: 1,
                hintFontSize: hintFontSize,
                fieldWidth: fieldWidth),
            MyTextField(
                isEnable: homeCtrl.isLoading.value ? false : true,
                size: size,
                controller: homeCtrl.numberCtrl,
                title: 'Mobile Number',
                maxLines: 1,
                hintFontSize: hintFontSize,
                fieldWidth: fieldWidth),
            MyTextField(
                isEnable: homeCtrl.isLoading.value ? false : true,
                size: size,
                controller: homeCtrl.serviceCtrl,
                title: 'Service of interest',
                maxLines: 1,
                hintFontSize: hintFontSize,
                fieldWidth: fieldWidth),
            MyTextField(
                isEnable: homeCtrl.isLoading.value ? false : true,
                size: size,
                controller: homeCtrl.timelineCtrl,
                title: 'Timeline',
                maxLines: 1,
                hintFontSize: hintFontSize,
                fieldWidth: fieldWidth),
            MyTextField(
                isEnable: homeCtrl.isLoading.value ? false : true,
                size: size,
                controller: homeCtrl.detailsCtrl,
                title: 'Project Details',
                maxLines: 6,
                hintFontSize: hintFontSize,
                fieldWidth: fieldWidth),
          ],
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyOutlinedButton(
                  title: 'Send',
                  onPressed: homeCtrl.isLoading.value
                      ? () {}
                      : () => homeCtrl
                          .sendDataToGoogleSheet(
                              date: DateTime.now().toString(),
                              name: homeCtrl.nameCtrl.text.trim(),
                              email: homeCtrl.emailCtrl.text.trim(),
                              mobNumber: homeCtrl.numberCtrl.text.trim(),
                              service: homeCtrl.serviceCtrl.text.trim(),
                              timeline: homeCtrl.timelineCtrl.text.trim(),
                              details: homeCtrl.detailsCtrl.text.trim())
                          .then((value) => Get.snackbar(
                              'Thank You for Your Interest!',
                              '''Your message has been successfully sent. I appreciate you reaching out, and I'm excited to connect with you! I will get back to you as soon as possible.\nHave a great day!''',
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.2,
                                  vertical: size.width * 0.1),
                              titleText: Text(
                                'Thank You for Your Interest!',
                                style: Appstyles.subHeadline(
                                    context: context,
                                    fontSize: hintFontSize),
                              ),
                              messageText: Text(
                                '''Your message has been successfully sent. I appreciate you reaching out, and I'm excited to connect with you! I will get back to you as soon as possible.\nHave a great day!''',
                                style: Appstyles.content(
                                    context: context,
                                    fontSize: hintFontSize),
                              ),
                              reverseAnimationCurve: Curves.elasticOut)),
                  icon: homeCtrl.isLoading.value
                      ? FontAwesomeIcons.circle
                      : Icons.send,
                ),
              ),
              spaceWidget
            ],
          ),
        )
      ],
    );
  }
}

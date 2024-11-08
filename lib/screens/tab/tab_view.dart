import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amalportfolio/core/constants/constants.dart';
import 'package:amalportfolio/core/font/font_size.dart';
import 'package:amalportfolio/core/styles/appstyles.dart';
import 'package:amalportfolio/screens/common/my_elevated_button.dart';
import 'package:amalportfolio/screens/controllers/home_controller/home_controller.dart';
import 'package:amalportfolio/screens/tab/widgets/skills_widget.dart';
import 'package:amalportfolio/screens/web/widgets/home_title_section_widget.dart';
import 'package:amalportfolio/screens/widgets/about_image_widget.dart';
import 'package:amalportfolio/screens/widgets/contact_me_widget.dart';
import 'package:amalportfolio/screens/widgets/footer_widget.dart';
import 'package:amalportfolio/screens/widgets/home_image_widget.dart';
import 'package:amalportfolio/screens/widgets/portfolio_widget.dart';
import 'package:amalportfolio/screens/widgets/scroll_up_widget.dart';
import 'package:amalportfolio/screens/widgets/services_widget.dart';
import 'package:amalportfolio/screens/widgets/web_appbar.dart';

class TabView extends StatefulWidget {
  const TabView({super.key});

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homeCtrl = Get.put(HomeController());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(size.width, size.width * 0.07),
        child: WebAppbar(
            size: size,
            controller: scrollController,
            myPlatformHeight: homeCtrl.tabScrollHeights),
      ),
      body: ListView(
        controller: scrollController,
        children: [
          Row(
            children: [
              HomeTitleSectionWidget(
                size: size,
                fontSize: 0.02,
                experienceWidth: 0.4,
                experienceHight: 0.1,
                mainWidth: 0.5,
                smallSpace: Appconstants.verySmallheight,
                verySmallSpace: Appconstants.tinyHeight,
                bigSpace: Appconstants.mediumheight,
                experienceFontSize: 0.017,
                myMainAxisAlignment: MainAxisAlignment.start,
                myCrossAxisAlignment: CrossAxisAlignment.start,
              ),
              HomeImageWidget(size: size),
            ],
          ),
          Appconstants.sHight(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Services', style: Appstyles.headline(context, 0.04)),
            ],
          ),
          Appconstants.largeheight,
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              homeCtrl.myServices.length,
              (index) => ServiesWidget(
                isMobile: false,
                size: size,
                service: homeCtrl.myServices[index],
                padding: 15,
                titleFontSize: FontSize.tabHeadingSize,
                descriptionFontSize: FontSize.tabcontentSize,
                containerHeight: 0.45,
                containerWidth: 0.45,
                iconSize: FontSize.tabIconSizeLarge,
              ),
            ),
          ),
          Appconstants.sHight(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('About Me', style: Appstyles.headline(context, 0.035)),
            ],
          ),
          Appconstants.largeheight,
          Row(
            children: [
              AboutMeImageWidget(size: size),
              SizedBox(
                height: size.width * 0.35,
                width: size.width * 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                          "I am a highly motivated and self-taught Flutter developer with a passion for building visually appealing, user-friendly mobile applications. With a strong foundation in object-oriented programming, I’m skilled at creating clean, efficient code and thrive on quickly adapting to new technologies. I enjoy transforming ideas into functional, beautiful apps that prioritize user experience and seamless performance.",
                          style: Appstyles.content(
                              context: context,
                              fontSize: FontSize.tabcontentSize)),
                      Row(
                        children: [
                          MyElevationButton(
                              title: 'Hire Me',
                              onPressed: () => homeCtrl.openMail()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Appconstants.largeheight,
          SizedBox(
            child: Wrap(
              runSpacing: 20,
              alignment: WrapAlignment.spaceEvenly,
              children: List.generate(
                  homeCtrl.skills.length,
                  (index) => TabSkillsWidget(
                      skill: homeCtrl.skills[index],
                      size: size,
                      fontSize: FontSize.tabcontentSize,
                      containerWidth: 0.15)),
            ),
          ),
          Appconstants.sHight(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Portfolio', style: Appstyles.headline(context, 0.035)),
            ],
          ),
          PortfolioWidget(
            size: size,
            popupMainVerticalPadding: checkScreenSize(size),
            popupMainHorizontalPadding: 10,
            popupAppIconPadding: 0.01,
            popupIconWidth: 0.08,
            popupIconHeight: 0.08,
            popupAppTitleFontSize: FontSize.tabHeadingSize,
            popupTemplatewidth: 0.25,
            popupTemplateHorizontalPadding: 0.005,
            popupTemplateVerticalPadding: 0.01,
            gridMainPadding: 0.1,
            maxCrossAxisExtent: 500,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2,
            portfolioHeight: 0.65,
            portfolioHorzontalPadding: 0.15,
            portfolioVerticalPadding: 0.01,
            tabLabelFontSize: FontSize.tabHeadingSize,
            tabMainPadding: 0.02,
            downloadOnTap: () => log('hahah'),
          ),
          Appconstants.sHight(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Contact me', style: Appstyles.headline(context, 0.035)),
            ],
          ),
          ContactMeWidget(
              size: size,
              hintFontSize: FontSize.tabcontentSize,
              fieldWidth: 0.45,
              sendButton: () => log('send'),
              spaceWidget: Appconstants.largeWidth),
          FooterWidget(
            size: size,
            fontSize: FontSize.tabcontentSize,
            emailOnTap: () => homeCtrl.openMail(),
            scrollController: scrollController,
            numberOnTap: () => log('mobile'),
            myPlatformHeight: homeCtrl.tabScrollHeights,
          )
        ],
      ),
      floatingActionButton: ScrollUpWidget(
          homeCtrl: homeCtrl, scrollController: scrollController),
    );
  }
}

double checkScreenSize(Size size) {
  if (size.width >= 750) {
    if (size.height >= 600) {
      return 4;
    } else {
      return 100;
    }
  } else if (size.width >= 425) {
    if (size.height >= 600) {
      return 5;
    } else {
      return 100;
    }
  }
  if (size.height >= 600) {
    if (size.height >= 600) {
      return 5;
    } else {
      return 100;
    }
  } else {
    return 100;
  }
}

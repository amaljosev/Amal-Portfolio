import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amalportfolio/core/constants/constants.dart';
import 'package:amalportfolio/core/font/font_size.dart';
import 'package:amalportfolio/core/styles/appstyles.dart';
import 'package:amalportfolio/screens/controllers/home_controller/home_controller.dart';
import 'package:amalportfolio/screens/web/widgets/home_title_section_widget.dart';
import 'package:amalportfolio/screens/widgets/about_image_widget.dart';
import 'package:amalportfolio/screens/widgets/about_skills_widget.dart';
import 'package:amalportfolio/screens/widgets/contact_me_widget.dart';
import 'package:amalportfolio/screens/widgets/footer_widget.dart';
import 'package:amalportfolio/screens/widgets/home_image_widget.dart';
import 'package:amalportfolio/screens/widgets/portfolio_widget.dart';
import 'package:amalportfolio/screens/widgets/scroll_up_widget.dart';
import 'package:amalportfolio/screens/widgets/services_widget.dart';
import 'package:amalportfolio/screens/widgets/web_appbar.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homeCtrl = Get.put(HomeController());
    return Scaffold(
      floatingActionButton: ScrollUpWidget(
          homeCtrl: homeCtrl, scrollController: _scrollController),
      appBar: PreferredSize(
        preferredSize: Size(size.width, size.width * 0.05),
        child: WebAppbar(
            size: size,
            controller: _scrollController,
            myPlatformHeight: homeCtrl.webScrollHeights),
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          Row(
            children: [
              HomeTitleSectionWidget(
                size: size,
                fontSize: 0.02,
                experienceWidth: 0.27,
                experienceHight: 0.06,
                mainWidth: 0.5,
                verySmallSpace: Appconstants.verySmallheight,
                bigSpace: Appconstants.extraLargeheight,
                smallSpace: Appconstants.tinyHeight,
                experienceFontSize: 0.01,
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
              Text('Services', style: Appstyles.headline(context, 0.035)),
            ],
          ),
          Appconstants.largeheight,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              homeCtrl.myServices.length,
              (index) => ServiesWidget(
                isMobile: false,
                size: size,
                titleFontSize: FontSize.webHeadingSize,
                descriptionFontSize: FontSize.webcontentSize,
                service: homeCtrl.myServices[index],
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
              AboutAndSkillsWidget(
                size: size,
                mySkills: homeCtrl.skills,
              ),
            ],
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
            popupAppIconPadding: 0.02,
            popupIconWidth: 0.08,
            popupIconHeight: 0.08,
            popupAppTitleFontSize: FontSize.webHeadingSize,
            popupTemplatewidth: 0.15,
            popupTemplateHorizontalPadding: 0.005,
            popupTemplateVerticalPadding: 0.01,
            gridMainPadding: 0.1,
            maxCrossAxisExtent: 500,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2,
            portfolioHeight: checkScreenSizeForGrid(size),
            portfolioHorzontalPadding: 0.15,
            portfolioVerticalPadding: 0.01,
            tabLabelFontSize: FontSize.webHeadingSize,
            tabMainPadding: 0.015,
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
              hintFontSize: FontSize.webcontentSize,
              fieldWidth: 0.4,
              spaceWidget: Appconstants.sWidth(context)),
          FooterWidget(
            size: size,
            fontSize: FontSize.webcontentSize,
            emailOnTap: () => homeCtrl.openMail(),
            scrollController: _scrollController,
            numberOnTap: () {},
            myPlatformHeight: homeCtrl.webScrollHeights,
          )
        ],
      ),
    );
  }
}

double checkScreenSizeForGrid(Size size) {
  if (size.width <= 1050) {
    return 0.6;
  } else {
    return 0.25;
  }
}

double checkScreenSize(Size size) {
  if (size.width >= 2500) {
    if (size.height >= 600) {
      return 90;
    } else {
      return 100;
    }
  } else if (size.width >= 1440) {
    if (size.height >= 600) {
      return 9;
    } else {
      return 1000;
    }
  } else if (size.width >= 1024) {
    if (size.height >= 1000) {
      return 3;
    } else if (size.height >= 600) {
      return 6;
    } else {
      return 10;
    }
  } else {
    if (size.height >= 600) {
      return 5;
    } else {
      return 100;
    }
  }
}

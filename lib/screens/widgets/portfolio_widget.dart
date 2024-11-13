import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amalportfolio/core/styles/appstyles.dart';
import 'package:amalportfolio/screens/controllers/home_controller/home_controller.dart';
import 'package:amalportfolio/screens/widgets/projects_widget.dart';

class PortfolioWidget extends StatelessWidget {
  const PortfolioWidget(
      {super.key,
      required this.size,
      required this.popupAppIconPadding,
      required this.popupIconWidth,
      required this.popupIconHeight,
      required this.popupAppTitleFontSize,
      this.downloadOnTap,
      required this.popupTemplatewidth,
      required this.popupTemplateHorizontalPadding,
      required this.popupTemplateVerticalPadding,
      required this.gridMainPadding,
      required this.maxCrossAxisExtent,
      required this.mainAxisSpacing,
      required this.crossAxisSpacing,
      required this.childAspectRatio,
      required this.portfolioHeight,
      required this.portfolioHorzontalPadding,
      required this.portfolioVerticalPadding,
      required this.tabLabelFontSize,
      required this.tabMainPadding,
      required this.popupMainHorizontalPadding,
      required this.popupMainVerticalPadding});

  final Size size;
  final double popupMainHorizontalPadding;
  final double popupMainVerticalPadding;
  final double popupAppIconPadding;
  final double popupIconWidth;
  final double popupIconHeight;
  final double popupAppTitleFontSize;
  final void Function()? downloadOnTap;
  final double popupTemplatewidth;
  final double popupTemplateHorizontalPadding;
  final double popupTemplateVerticalPadding;
  final double gridMainPadding;
  final double maxCrossAxisExtent;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;
  final double portfolioHeight;
  final double portfolioHorzontalPadding;
  final double portfolioVerticalPadding;
  final double tabLabelFontSize;
  final double tabMainPadding;
  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.find<HomeController>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * tabMainPadding),
      child: DefaultTabController(
        length: 3,
        child: SizedBox(
          height: size.width * portfolioHeight,
          child: Column(
            children: [
              Card.filled(
                margin: EdgeInsets.symmetric(
                    horizontal: size.width * portfolioHorzontalPadding,
                    vertical: size.width * portfolioVerticalPadding),
                color: Theme.of(context).primaryColor,
                child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    padding: const EdgeInsets.all(5),
                   
                    labelStyle: Appstyles.headline(context, tabLabelFontSize),
                    splashBorderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                    tabs: const [
                      Tab(text: 'Mobile Apps'),
                      Tab(text: 'Web Apps'),
                      Tab(text: 'Desktop Apps')
                    ]),
              ),
              Flexible(
                  child: TabBarView(
                children: [
                  ProjectsWidget(
                      size: size,
                      projects: homeCtrl.mobApps,
                      isMobile: true,
                      popupMainHorizontalPadding: popupMainHorizontalPadding,
                      popupMainVerticalPadding: popupMainVerticalPadding,
                      popupAppIconPadding: popupAppIconPadding,
                      popupIconWidth: popupIconWidth,
                      popupIconHeight: popupIconHeight,
                      popupAppTitleFontSize: popupAppTitleFontSize,
                      popupTemplatewidth: popupTemplatewidth,
                      popupTemplateHorizontalPadding:
                          popupTemplateHorizontalPadding,
                      popupTemplateVerticalPadding:
                          popupTemplateVerticalPadding,
                      gridMainPadding: gridMainPadding,
                      maxCrossAxisExtent: maxCrossAxisExtent,
                      mainAxisSpacing: mainAxisSpacing,
                      crossAxisSpacing: crossAxisSpacing,
                      childAspectRatio: childAspectRatio),
                  ProjectsWidget(
                      size: size,
                      projects: homeCtrl.webApps,
                      isMobile: false,
                      popupMainHorizontalPadding: popupMainHorizontalPadding,
                      popupMainVerticalPadding: popupMainVerticalPadding,
                      popupAppIconPadding: popupAppIconPadding,
                      popupIconWidth: popupIconWidth,
                      popupIconHeight: popupIconHeight,
                      popupAppTitleFontSize: popupAppTitleFontSize,
                      popupTemplatewidth: popupTemplatewidth,
                      popupTemplateHorizontalPadding:
                          popupTemplateHorizontalPadding,
                      popupTemplateVerticalPadding:
                          popupTemplateVerticalPadding,
                      gridMainPadding: gridMainPadding,
                      maxCrossAxisExtent: maxCrossAxisExtent,
                      mainAxisSpacing: mainAxisSpacing,
                      crossAxisSpacing: crossAxisSpacing,
                      childAspectRatio: childAspectRatio),
                  ProjectsWidget(
                      size: size,
                      projects: homeCtrl.desktopApps,
                      isMobile: false,
                      popupMainHorizontalPadding: popupMainHorizontalPadding,
                      popupMainVerticalPadding: popupMainVerticalPadding,
                      popupAppIconPadding: popupAppIconPadding,
                      popupIconWidth: popupIconWidth,
                      popupIconHeight: popupIconHeight,
                      popupAppTitleFontSize: popupAppTitleFontSize,
                      popupTemplatewidth: popupTemplatewidth,
                      popupTemplateHorizontalPadding:
                          popupTemplateHorizontalPadding,
                      popupTemplateVerticalPadding:
                          popupTemplateVerticalPadding,
                      gridMainPadding: gridMainPadding,
                      maxCrossAxisExtent: maxCrossAxisExtent,
                      mainAxisSpacing: mainAxisSpacing,
                      crossAxisSpacing: crossAxisSpacing,
                      childAspectRatio: childAspectRatio),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

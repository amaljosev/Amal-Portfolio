import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amalportfolio/core/font/font_size.dart';
import 'package:amalportfolio/core/styles/appstyles.dart';
import 'package:amalportfolio/screens/controllers/home_controller/home_controller.dart';
import 'package:amalportfolio/screens/models/projects_apps_model.dart';
import 'package:amalportfolio/screens/models/projects_model.dart';
import 'package:amalportfolio/screens/web/widgets/mobileapps_widget.dart';

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({
    super.key,
    required this.projects,
    required this.size,
    required this.isMobile,
    required this.popupMainHorizontalPadding,
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
    required this.popupMainVerticalPadding,
  });

  final List<ProjectsModel> projects;
  final Size size;
  final bool isMobile;
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

  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.find<HomeController>();
    return GridView.builder(
      padding: EdgeInsets.all(gridMainPadding),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: maxCrossAxisExtent,
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final ProjectsModel project = projects[index];
        final ProjectsAppsModel app = homeCtrl.myApps[index];
        bool isHover = false;

        return StatefulBuilder(
          builder: (context, setState) {
            return MouseRegion(
              onEnter: (_) => setState(() => isHover = true),
              onExit: (_) => setState(() => isHover = false),
              child: FutureBuilder(
                future: precacheImage(AssetImage(project.template), context),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return GestureDetector(
                      onTap: !isMobile
                          ? () => homeCtrl.openExternalWeb(project.link)
                          : () => showAdaptiveDialog(
                              context: context,
                              builder: (context) => MobileAppsWidget(
                                size: size,
                                project: app,
                                popupAppIconPadding: popupAppIconPadding,
                                popupAppTitleFontSize: popupAppTitleFontSize,
                                popupIconHeight: popupIconHeight,
                                popupIconWidth: popupIconWidth,
                                popupMainHorizontalPadding: popupMainHorizontalPadding,
                                popupMainVerticalPadding: popupMainVerticalPadding,
                                popupTemplateHorizontalPadding: popupTemplateHorizontalPadding,
                                popupTemplateVerticalPadding: popupTemplateVerticalPadding,
                                popupTemplatewidth: popupTemplatewidth,
                                downloadOnTap: downloadOnTap,
                              ),
                            ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                            image: AssetImage(project.template),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context).dividerColor
                                .withOpacity(isHover ? 0.9 : 0),
                          ),
                          child: Center(
                            child: Text(
                              isHover ? project.title : '',
                              style: Appstyles.headline(context, FontSize.webcontentSize),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}

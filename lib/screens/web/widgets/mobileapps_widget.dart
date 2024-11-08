import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amalportfolio/core/colors/appcolors.dart';
import 'package:amalportfolio/core/constants/constants.dart';
import 'package:amalportfolio/core/styles/appstyles.dart';
import 'package:amalportfolio/screens/common/my_elevated_button.dart';
import 'package:amalportfolio/screens/controllers/home_controller/home_controller.dart';
import 'package:amalportfolio/screens/models/projects_apps_model.dart';
import 'package:amalportfolio/screens/web/widgets/arrow_widget.dart';

class MobileAppsWidget extends StatefulWidget {
  const MobileAppsWidget(
      {super.key,
      required this.size,
      required this.project,
      required this.popupMainHorizontalPadding,
      required this.popupAppIconPadding,
      required this.popupIconWidth,
      required this.popupIconHeight,
      required this.popupAppTitleFontSize,
      this.downloadOnTap,
      required this.popupTemplatewidth,
      required this.popupTemplateHorizontalPadding,
      required this.popupTemplateVerticalPadding,
      required this.popupMainVerticalPadding});

  final Size size;
  final ProjectsAppsModel project;
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
  @override
  State<MobileAppsWidget> createState() => _MobileAppsWidgetState();
}

class _MobileAppsWidgetState extends State<MobileAppsWidget> {
  final homeCtrl = Get.find<HomeController>();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: widget.size.width / widget.popupMainHorizontalPadding,
          vertical: widget.size.height / widget.popupMainVerticalPadding),
      color: AppColors.secondaryBackground,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: widget.size.width * widget.popupAppIconPadding,
                horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card.outlined(
                  color: Colors.transparent,
                  child: Image.asset(widget.project.icon,
                      height: widget.size.width * widget.popupIconHeight,
                      width: widget.size.width * widget.popupIconWidth),
                ),
                Appconstants.mediumWidth,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.project.title,
                        style: Appstyles.subHeadline(
                            context: context,
                            fontSize: widget.popupAppTitleFontSize)),
                    Appconstants.smallheight,
                    MyElevationButton(
                      title: 'Download',
                      onPressed: ()=>homeCtrl.openExternalWeb(widget.project.link),
                    )
                  ],
                ),
                const Spacer(),
                widget.size.width<=300?Appconstants.emptyWidget: IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(
                      Icons.close,
                      color: AppColors.textGray,
                    )),
                Appconstants.mediumWidth
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              ArrowWidget(
                  onTap: () => homeCtrl.scrollLeft(_scrollController),
                  isLeft: true),
              Flexible(
                child: ListView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                          width: widget.size.width * widget.popupTemplatewidth,
                          margin: EdgeInsets.symmetric(
                              vertical: widget.size.height *
                                  widget.popupTemplateVerticalPadding,
                              horizontal: widget.size.width *
                                  widget.popupTemplateHorizontalPadding),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: AssetImage(
                                      widget.project.templates[index]),
                                  fit: BoxFit.cover)),
                        ),
                    itemCount: widget.project.templates.length),
              ),
              ArrowWidget(
                  onTap: () => homeCtrl.scrollRight(_scrollController),
                  isLeft: false),
            ],
          ))
        ],
      ),
    );
  }
}

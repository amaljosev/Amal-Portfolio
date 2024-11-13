import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:amalportfolio/core/colors/appcolors.dart';
import 'package:amalportfolio/core/styles/appstyles.dart';
import 'package:amalportfolio/screens/models/services_model.dart';

class ServiesWidget extends StatelessWidget {
  const ServiesWidget(
      {super.key,
      required this.size,
      required this.service,
      this.padding = 20,
      required this.descriptionFontSize,
      required this.titleFontSize,
      required this.isMobile,
      this.containerWidth = 0.3,
      this.containerHeight = 0.25,
      this.iconSize = 0.05});

  final Size size;
  final ServicesModel service;
  final double padding;
  final double descriptionFontSize;
  final double titleFontSize;
  final bool isMobile;
  final double containerWidth;
  final double containerHeight;
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMobile ? null : size.width * containerHeight,
      width: isMobile ? null : size.width * containerWidth,
      padding: EdgeInsets.all(padding),
      decoration:  BoxDecoration(
        color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.all(Radius.circular(18))),
          
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            service.title,
            style: Appstyles.subHeadline(
                context: context, fontSize: titleFontSize),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: FaIcon(
              service.icon,
              color: AppColors.accentOrange,
              size: size.width * iconSize,
            ),
          ),
          Text(
            service.description,
            style: Appstyles.content(
                context: context, fontSize: descriptionFontSize),
          ),
        ],
      ),
    );
  }
}

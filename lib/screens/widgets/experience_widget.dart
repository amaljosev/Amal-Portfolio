import 'package:flutter/material.dart';
import 'package:amalportfolio/core/colors/appcolors.dart';
import 'package:amalportfolio/core/styles/appstyles.dart';

class ExpeienceWidget extends StatelessWidget {
  const ExpeienceWidget(
      {super.key,
      required this.size,
      required this.containerWidth,
      required this.containerHeight,
      required this.containerFontSize});

  final Size size;
  final double containerWidth;
  final double containerHeight;
  final double containerFontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width * containerHeight,
      width: size.width * containerWidth,
      decoration: const BoxDecoration(
          color: AppColors.secondaryBackground,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('1+',
                    style: Appstyles.bodyText(
                        context: context,
                        color: AppColors.accentOrange,
                        fontSize: containerFontSize)),
                Text('Experience',
                    style: Appstyles.bodyText(
                        context: context,
                        color: AppColors.textLight,
                        fontSize: containerFontSize))
              ],
            ),
            const VerticalDivider(
              thickness: 2,
              indent: 5,
              endIndent: 5,
              color: Colors.white24,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('5+',
                    style: Appstyles.bodyText(
                        context: context,
                        color: AppColors.accentOrange,
                        fontSize: containerFontSize)),
                Text('Projects',
                    style: Appstyles.bodyText(
                        context: context,
                        color: AppColors.textLight,
                        fontSize: containerFontSize))
              ],
            ),
            const VerticalDivider(
              thickness: 2,
              indent: 5,
              endIndent: 5,
              color: Colors.white24,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('2+',
                    style: Appstyles.bodyText(
                        context: context,
                        color: AppColors.accentOrange,
                        fontSize: containerFontSize)),
                Text('Laguages',
                    style: Appstyles.bodyText(
                        context: context,
                        color: AppColors.textLight,
                        fontSize: containerFontSize))
              ],
            )
          ],
        ),
      ),
    );
  }
}

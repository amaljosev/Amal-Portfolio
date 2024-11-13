import 'package:amalportfolio/core/font/font_size.dart';
import 'package:amalportfolio/core/styles/appstyles.dart';
import 'package:flutter/material.dart';

class MainHeadingWidget extends StatelessWidget {
  const MainHeadingWidget({super.key, required this.heading});
  final String heading;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(heading,
            style: Appstyles.mainHeadline(
                context: context,
                fontSize: FontSize.webMainHeadingSize,
                color: Theme.of(context).textTheme.titleLarge?.color)),
      ],
    );
  }
}

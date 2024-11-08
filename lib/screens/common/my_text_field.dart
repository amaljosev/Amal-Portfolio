import 'package:flutter/material.dart';
import 'package:amalportfolio/core/colors/appcolors.dart';
import 'package:amalportfolio/core/styles/appstyles.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.size,
    required this.fieldWidth,
    required this.title,
    required this.maxLines,
    required this.hintFontSize,
    required this.controller,
    required this.isEnable,
  });
  final Size size;
  final double fieldWidth;
  final String title;
  final int maxLines;
  final double hintFontSize;
  final TextEditingController controller;
  final bool isEnable;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * fieldWidth,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          enabled: isEnable,
          maxLines: maxLines,
          controller: controller,
          cursorColor: AppColors.hoverActiveState,
          decoration: InputDecoration(
              hintText: title,
              labelText: title,
              labelStyle: Appstyles.textfieldHintStyle(
                  context: context, fontSize: hintFontSize),
              hintStyle:
                  Appstyles.content(context: context, fontSize: hintFontSize),
              filled: true,
              fillColor: AppColors.secondaryBackground,
              border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none)),
          style: Appstyles.content(context: context, fontSize: hintFontSize),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Appconstants {
  static const emptyWidget = SizedBox();
  static const verySmallheight = SizedBox(height: 3);
  static const tinyHeight = SizedBox(height: 5);
  static const smallheight = SizedBox(height: 10);
  static const mediumheight = SizedBox(height: 15);
  static const moderateheight = SizedBox(height: 20);
  static const standardheight = SizedBox(height: 25);
  static const largeheight = SizedBox(height: 30);
  static const extraLargeheight = SizedBox(height: 45);
  //////////////////////////////////////////////////////
  static const verySmallwidth = SizedBox(width: 3);
  static const tinyWidth = SizedBox(width: 5);
  static const smallWidth = SizedBox(width: 10);
  static const mediumWidth = SizedBox(width: 15);
  static const moderateWidth = SizedBox(width: 20);
  static const standardWidth = SizedBox(width: 25);
  static const largeWidth = SizedBox(width: 30);
  static const extraLargeWidth = SizedBox(width: 45);

  static sHight(BuildContext context) =>
      SizedBox(height: MediaQuery.of(context).size.width * 0.1);
      static sWidth(BuildContext context) =>
      SizedBox(width: MediaQuery.of(context).size.width * 0.1);
}

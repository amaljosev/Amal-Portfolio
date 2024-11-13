import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarMenu {
  final int index;
  final String title;
  final TextStyle style;
  final RxBool isActive;

  AppbarMenu({
    required this.index,
    required this.isActive,
    required this.title,
    required this.style,
  });
}

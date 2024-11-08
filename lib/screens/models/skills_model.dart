import 'package:flutter/material.dart';

class SkillsModel {
  final String title;
  final IconData? icon;

  SkillsModel({required this.title, required this.icon});
}
class TabSkillsModel {
  final String title;
  final double progress;

  TabSkillsModel({required this.title, required this.progress});
}
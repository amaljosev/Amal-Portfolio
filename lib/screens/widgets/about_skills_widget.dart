import 'package:flutter/material.dart';
import 'package:amalportfolio/core/font/font_size.dart';
import 'package:amalportfolio/core/styles/appstyles.dart';
import 'package:amalportfolio/screens/tab/widgets/skills_widget.dart';

class AboutAndSkillsWidget extends StatelessWidget {
  const AboutAndSkillsWidget({
    super.key,
    required this.size,
    required this.mySkills,
  });

  final Size size;
  final List mySkills;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.4,
      width: size.width * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
                "I am a highly motivated and self-taught Flutter developer with a passion for building visually appealing, user-friendly mobile applications. With a strong foundation in object-oriented programming, I’m skilled at creating clean, efficient code and thrive on quickly adapting to new technologies. I enjoy transforming ideas into functional, beautiful apps that prioritize user experience and seamless performance.",
                style: Appstyles.content(
                    context: context, fontSize: FontSize.webcontentSize)),
            SizedBox(
            child: Wrap(
              runSpacing: 20,
              alignment: WrapAlignment.spaceEvenly,
              children: List.generate(
                  mySkills.length,
                  (index) => TabSkillsWidget(
                      skill: mySkills[index],
                      size: size,
                      fontSize: FontSize.webcontentSize,
                      containerWidth: 0.1)),
            ),
          ),
          ],
        ),
      ),
    );
  }
}

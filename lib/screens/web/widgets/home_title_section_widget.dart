import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:amalportfolio/core/colors/appcolors.dart';
import 'package:amalportfolio/core/constants/constants.dart';
import 'package:amalportfolio/screens/controllers/home_controller/home_controller.dart';
import 'package:amalportfolio/screens/widgets/experience_widget.dart';
import 'package:amalportfolio/screens/common/my_elevated_button.dart';
import 'package:amalportfolio/screens/common/my_outlined_button.dart';
import 'package:amalportfolio/screens/widgets/social_widget.dart';

class HomeTitleSectionWidget extends StatefulWidget {
  const HomeTitleSectionWidget({
    super.key,
    required this.experienceWidth,
    required this.experienceHight,
    required this.smallSpace,
    required this.bigSpace,
    required this.size,
    required this.verySmallSpace,
    required this.experienceFontSize,
    required this.mainWidth,
    this.myCrossAxisAlignment = CrossAxisAlignment.start,
    required this.myMainAxisAlignment,
    required this.fontSize,
  });

  final Size size;
  final double mainWidth;
  final double fontSize;
  final double experienceWidth;
  final double experienceHight;
  final SizedBox smallSpace;
  final SizedBox bigSpace;
  final SizedBox verySmallSpace;
  final double experienceFontSize;
  final CrossAxisAlignment myCrossAxisAlignment;
  final MainAxisAlignment myMainAxisAlignment;

  @override
  _HomeTitleSectionWidgetState createState() => _HomeTitleSectionWidgetState();
}

class _HomeTitleSectionWidgetState extends State<HomeTitleSectionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animationHi;
  late Animation<Offset> _animationName;
  late Animation<Offset> _animationTitle;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Defining slide-down animations with staggered start delays
    _animationHi = Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.4, curve: Curves.bounceOut)));

    _animationName = Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.6, curve: Curves.bounceOut)));

    _animationTitle = Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.8, curve: Curves.bounceOut)));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeCtrl = Get.find<HomeController>();

    return SizedBox(
      width: widget.size.width * widget.mainWidth,
      child: Padding(
        padding: EdgeInsets.only(
          left: widget.myCrossAxisAlignment == CrossAxisAlignment.center ? 0.0 : 25.0,
          top: 30.0,
        ),
        child: Column(
          crossAxisAlignment: widget.myCrossAxisAlignment,
          mainAxisSize: MainAxisSize.min,
          children: [
            SlideTransition(
              position: _animationHi,
              child: Text(
                'Hi, I am',
                style: TextStyle(
                  color: AppColors.textGray,
                  fontSize: widget.size.width * widget.fontSize,
                ),
              ),
            ),
            SlideTransition(
              position: _animationName,
              child: Text(
                'Amal Jose',
                style: TextStyle(
                  color: AppColors.textGray,
                  fontSize: widget.size.width * (widget.fontSize + 0.02),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            
            SlideTransition(
              position: _animationTitle,
              child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [AppColors.accentOrange, Colors.red],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds),
                child: Text(
                  'Flutter Developer',
                  style: TextStyle(
                    fontSize: widget.size.width * (widget.fontSize + 0.03),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SocialWidget(mainAxisAlignment: widget.myMainAxisAlignment),
            widget.bigSpace,
            Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 10,
              children: [
                MyElevationButton(
                  title: 'Hire Me',
                  onPressed: () => homeCtrl.openMail(),
                ),
                Appconstants.mediumWidth,
                MyOutlinedButton(
                  icon: FontAwesomeIcons.download,
                  title: 'Download CV',
                  onPressed: () => homeCtrl.downloadPdf(),
                ),
              ],
            ),
            widget.bigSpace,
            ExpeienceWidget(
              size: widget.size,
              containerHeight: widget.experienceHight,
              containerWidth: widget.experienceWidth,
              containerFontSize: widget.experienceFontSize,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:amalportfolio/screens/controllers/home_controller/home_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialWidget extends StatefulWidget {
  const SocialWidget({super.key, required this.mainAxisAlignment});
  final MainAxisAlignment mainAxisAlignment;

  @override
  _SocialWidgetState createState() => _SocialWidgetState();
}

class _SocialWidgetState extends State<SocialWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Offset>> _animations;

  @override
  void initState() {
    super.initState();
    final homeCtrl = Get.find<HomeController>();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Create a separate animation for each icon with staggered intervals
    _animations = List.generate(
      homeCtrl.social.length,
      (index) => Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
          .animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(
          index * 0.1, // Stagger each icon by 0.1s
          0.6 + index * 0.1, // Adjust for smoother transition
          curve: Curves.easeOut,
        ),
      )),
    );

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

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      children: List.generate(
        homeCtrl.social.length,
        (index) => SlideTransition(
          position: _animations[index],
          child: IconButton(
            onPressed: () => openSocial(index, homeCtrl),
            icon: FaIcon(homeCtrl.social[index].icon),
            tooltip: homeCtrl.social[index].toolTip,
          ),
        ),
      ),
    );
  }
}

Future<void> openSocial(int index, HomeController controller) async {
  final url = Uri.parse(controller.social[index].url);
  await launchUrl(url, mode: LaunchMode.externalApplication);
}

import 'package:flutter/material.dart';
import 'package:amalportfolio/screens/mobile/mobile_view.dart';
import 'package:amalportfolio/screens/tab/tab_view.dart';
import 'package:amalportfolio/screens/web/web_view.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 950) {
          return const WebView();
        } else if (constraints.maxWidth > 600) {
          return const TabView();
        } else {
          return const MobileView();
        }
      },
    );
  }
}

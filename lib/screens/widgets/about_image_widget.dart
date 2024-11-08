import 'package:flutter/material.dart';
import 'package:amalportfolio/core/colors/appcolors.dart';

class AboutMeImageWidget extends StatelessWidget {
  const AboutMeImageWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.35,
      width: size.width * 0.5,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: size.width * 0.28,
            width: size.width * 0.25,
            decoration: const BoxDecoration(
              color: AppColors.secondaryBackground,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(130),
                topRight: Radius.circular(130),
              ),
            ),
          ),
          FutureBuilder(
            future: precacheImage(AssetImage('assets/images/amal_landing.png'), context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Image.asset(
                  'assets/images/amal_landing.png',
                  filterQuality: FilterQuality.high,
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}

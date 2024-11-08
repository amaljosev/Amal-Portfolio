import 'package:flutter/material.dart';
import '../../core/colors/appcolors.dart';

class HomeImageWidget extends StatelessWidget {
  const HomeImageWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.5,
      width: size.width * 0.5,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CircleAvatar(
            radius: size.width * 0.2,
            backgroundColor: AppColors.secondaryBackground,
          ),
          FutureBuilder(
            future: precacheImage(
                AssetImage('assets/images/amal_home.png'), context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Image.asset('assets/images/amal_home.png');
              } else {
                return Center(child: const CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}

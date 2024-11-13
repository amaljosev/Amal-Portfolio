import 'package:amalportfolio/core/colors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:amalportfolio/screens/controllers/home_controller/home_controller.dart';
import 'package:get/get.dart';

class ScrollUpWidget extends StatefulWidget {
  const ScrollUpWidget({
    super.key,
    required this.homeCtrl,
    required ScrollController scrollController,
  }) : _scrollController = scrollController;

  final HomeController homeCtrl;
  final ScrollController _scrollController;

  @override
  _ScrollUpWidgetState createState() => _ScrollUpWidgetState();
}

class _ScrollUpWidgetState extends State<ScrollUpWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 1.0, end: 1.2)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 50),
      TweenSequenceItem(
          tween: Tween(begin: 1.2, end: 1.0)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 50),
    ]).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onHover(bool isHovering) {
    if (isHovering) {
      _animationController.forward();
      widget.homeCtrl.isHoverFloatingActionButton.value = true;
    } else {
      _animationController.reverse();
      widget.homeCtrl.isHoverFloatingActionButton.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => MouseRegion(
          onEnter: (event) => _onHover(true),
          onExit: (event) => _onHover(false),
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: FloatingActionButton(
              tooltip: 'Scroll to top',
              onPressed: () => widget.homeCtrl.menuScroll(
                duration: 1000,
                pixel: widget._scrollController.position.minScrollExtent,
                scrollController: widget._scrollController,
              ),
              child: Icon(
                Icons.keyboard_arrow_up_outlined,
                color: widget.homeCtrl.isHoverFloatingActionButton.value
                    ? AppColors.hoverActiveState
                    : null,
              ),
            ),
          ),
        ));
  }
}

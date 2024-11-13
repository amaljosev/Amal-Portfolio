import 'package:flutter/material.dart';

class AnimatedProgressIndicator extends StatefulWidget {
  const AnimatedProgressIndicator({super.key,  this.progressValue=1.0});

  @override
  AnimatedProgressIndicatorState createState() =>
      AnimatedProgressIndicatorState();
      final double progressValue;
}

class AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _valueAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _valueAnimation = Tween<double>(begin: 0.0, end: widget.progressValue).animate(_controller);

    // Animate the color between two colors
    _colorAnimation = ColorTween(
      begin: Colors.red,
      end: Colors.deepOrangeAccent,
    ).animate(_controller);

    // Start the animation once
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => CircularProgressIndicator(
        backgroundColor: Theme.of(context).primaryColor,
        value: _valueAnimation.value,
        valueColor: _colorAnimation,
      ),
    );
  }
}

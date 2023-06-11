library animated_gesture_detector;

import 'package:flutter/material.dart';

class AnimatedGestureDetector extends StatefulWidget {
  final Widget child;
  final Function() onTap;
  const AnimatedGestureDetector(
      {super.key, required this.child, required this.onTap});

  @override
  State<AnimatedGestureDetector> createState() =>
      _AnimatedGestureDetectorState();
}

class _AnimatedGestureDetectorState extends State<AnimatedGestureDetector> {
  double scale = 1;
  Duration animDuration = const Duration(milliseconds: 30);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          scale = 1.5;
        });
        widget.onTap();
        await Future.delayed(animDuration).then(
          (value) {
            setState(() {
              scale = 1;
            });
          },
        );
      },
      child: AnimatedScale(
          scale: scale, duration: animDuration, child: widget.child),
    );
  }
}

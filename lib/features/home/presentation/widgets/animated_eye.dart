
import 'package:flutter/material.dart';

class AnimatedEye extends StatelessWidget {
  final double width;
  final double height;
  final double radius;
  final Color color;

  const AnimatedEye({
    super.key,
    required this.width,
    required this.height,
    required this.radius,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}


import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';

class ExperienceMouth extends StatelessWidget {
  final double sliderValue;
  final Color color;

  const ExperienceMouth({
    super.key,
    required this.sliderValue,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final double rotationProgress =
        (sliderValue - 1).clamp(0.0, 1.0);

    return AnimatedRotation(
      turns: rotationProgress / 2,
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOutCubic,
      child: TweenAnimationBuilder<Color?>(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOutCubic,
        tween: ColorTween(end: color),
        builder: (context, animatedColor, child) {
          return Image.asset(
            AppAssets.mouseBad,
            width: 91.46,
            color: animatedColor,
          );
        },
      ),
    );
  }
}

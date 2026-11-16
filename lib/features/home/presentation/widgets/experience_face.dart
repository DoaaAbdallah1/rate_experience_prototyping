
import 'package:flutter/material.dart';

import '../../../../core/constants/experience_colors.dart';
import 'animated_eye.dart';
import 'experience_mouth.dart';
import 'face_config.dart';

class ExperienceFace extends StatelessWidget {
  final int selectedValue;
  final double sliderValue;
  final ExperienceColors colors;

  const ExperienceFace({
    super.key,
    required this.selectedValue,
    required this.sliderValue,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    final config = FaceConfig.fromValue(selectedValue);

    return SizedBox(
      width: 330,
      height: 240,
      child: Stack(
        children: [
          // Left eye
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic,
            top: config.eyeTop,
            left: config.eyePosition,
            child: AnimatedEye(
              width: config.eyeWidth,
              height: config.eyeHeight,
              radius: config.eyeRadius,
              color: colors.primary,
            ),
          ),

          // Right eye
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOutCubic,
            top: config.eyeTop,
            right: config.eyePosition,
            child: AnimatedEye(
              width: config.eyeWidth,
              height: config.eyeHeight,
              radius: config.eyeRadius,
              color: colors.primary,
            ),
          ),

          // Mouth
          Positioned(
            bottom: 40,
            left: 1,
            right: 1,
            child: Center(
              child: ExperienceMouth(
                sliderValue: sliderValue,
                color: colors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';

import '../../../../core/constants/experience_colors.dart';
import 'icon_custom.dart';

class ExperienceHeader extends StatelessWidget {
  final ExperienceColors colors;

  const ExperienceHeader({super.key, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconCustom(
              icon: Icons.clear_rounded,
              color: colors.primary,
              colorBackground: colors.primary.withAlpha(102),
            ),
            IconCustom(
              icon: Icons.priority_high_rounded,
              color: colors.primary,
              colorBackground: colors.primary.withAlpha(102),
            ),
          ],
        ),
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOutCubic,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: colors.primary,
          ),
          textAlign: TextAlign.center,
          child: const Text(
            'How was your shopping\nexperience ?',
          ),
        ),
      ],
    );
  }
}

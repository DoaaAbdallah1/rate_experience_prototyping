
import 'package:flutter/material.dart';

class IconCustom extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color colorBackground;

  const IconCustom({
    super.key,
    required this.icon,
    required this.color,
    required this.colorBackground,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOutCubic,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colorBackground,
      ),
      child: IconButton(
        onPressed: () {},
        icon: Padding(
          padding: const EdgeInsets.all(4),
          child: TweenAnimationBuilder<Color?>(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInOutCubic,
            tween: ColorTween(end: color),
            builder: (context, animatedColor, child) {
              return Icon(
                icon,
                size: 28,
                color: animatedColor,
              );
            },
          ),
        ),
      ),
    );
  }
}

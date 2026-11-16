
import 'package:flutter/material.dart';

import '../../../../core/constants/experience_colors.dart';

class ExperienceLabel extends StatefulWidget {
  final int selectedValue;
  final ExperienceColors colors;

  const ExperienceLabel({
    super.key,
    required this.selectedValue,
    required this.colors,
  });

  @override
  State<ExperienceLabel> createState() => _ExperienceLabelState();
}

class _ExperienceLabelState extends State<ExperienceLabel> {
  static const List<String> labels = [
    'BAD',
    'NOT BAD',
    'GOOD',
  ];

  int previousValue = 0;

  @override
  void didUpdateWidget(covariant ExperienceLabel oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.selectedValue != widget.selectedValue) {
      previousValue = oldWidget.selectedValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool movingForward =
        widget.selectedValue > previousValue;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) {
        final bool isEntering =
            child.key == ValueKey(widget.selectedValue);

        final double direction = movingForward ? 1 : -1;

        final Offset beginOffset = isEntering
            ? Offset(direction, 0)
            : Offset(-direction, 0);

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: beginOffset,
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: Text(
        labels[widget.selectedValue],
        key: ValueKey(widget.selectedValue),
        style: TextStyle(
          fontSize: 76.6,
          fontWeight: FontWeight.w800,
          color: widget.colors.primary,
          letterSpacing: -11,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

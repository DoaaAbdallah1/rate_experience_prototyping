
import 'package:flutter/material.dart';

class BuildLabel extends StatelessWidget {
  final String text;
  final int index;
  final int value;
  final Color primaryColor;

  const BuildLabel({
    super.key,
    required this.text,
    required this.index,
    required this.value,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeInOutCubic,
      style: TextStyle(
        fontSize: 16.32,
        fontWeight: value == index
            ? FontWeight.w800
            : FontWeight.w400,
        color: value == index
            ? primaryColor
            : primaryColor.withAlpha(120),
      ),
      child: Text(text),
    );
  }
}

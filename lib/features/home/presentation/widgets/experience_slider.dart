
import 'package:flutter/material.dart';
import 'package:rate_experience_prototyping/core/constants/app_assets.dart';

import 'build_label.dart';

class ExperienceSlider extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final Color primaryColor;
  final Color trackColor;

  const ExperienceSlider({
    super.key,
    required this.value,
    required this.onChanged,
    required this.primaryColor,
    required this.trackColor,
  });

  @override
  State<ExperienceSlider> createState() => _ExperienceSliderState();
}

class _ExperienceSliderState extends State<ExperienceSlider> {
  static const double thumbWidth = 58;

  bool isDragging = false;

  void _updateValue(double dx, double width) {
    final double start = thumbWidth / 2;
    final double end = width - thumbWidth / 2;

    final double position = (dx - start) / (end - start);

    widget.onChanged((position * 2).clamp(0.0, 2.0));
  }

  void _selectPoint(double dx, double width) {
    final double start = thumbWidth / 2;
    final double end = width - thumbWidth / 2;

    final double position = (dx - start) / (end - start);

    widget.onChanged(
      ((position * 2).round()).clamp(0, 2).toDouble(),
    );
  }

  void _snapToNearestPoint() {
    widget.onChanged(
      widget.value.roundToDouble().clamp(0.0, 2.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;

        final double start = thumbWidth / 2;
        final double end = width - thumbWidth / 2;

        final double position =
            start + (end - start) * (widget.value / 2);

        final int selectedIndex = widget.value.round();

        final String thumbAsset = switch (selectedIndex) {
          0 => AppAssets.variantIconRed,
          1 => AppAssets.variantIconYellow,
          _ => AppAssets.defaultIcon,
        };

        return GestureDetector(
          behavior: HitTestBehavior.opaque,

          onTapDown: (details) {
            _selectPoint(details.localPosition.dx, width);
          },

          onHorizontalDragStart: (_) {
            setState(() => isDragging = true);
          },

          onHorizontalDragUpdate: (details) {
            _updateValue(details.localPosition.dx, width);
          },

          onHorizontalDragEnd: (_) {
            _snapToNearestPoint();
            setState(() => isDragging = false);
          },

          onHorizontalDragCancel: () {
            setState(() => isDragging = false);
          },

          child: SizedBox(
            height: 100,
            width: width,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Slider track
                Positioned(
                  left: start,
                  right: thumbWidth / 2,
                  top: 27,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOutCubic,
                    height: 6,
                    decoration: BoxDecoration(
                      color: widget.trackColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),

                // Three points
                for (int i = 0; i < 3; i++)
                  Positioned(
                    left: start + (end - start) * (i / 2) - 10,
                    top: 19,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeInOutCubic,
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: widget.trackColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),

                
                // Moving icon
                if (isDragging)
                  Positioned(
                    left: position - thumbWidth / 2,
                    top: -2,
                    child: Image.asset(
                      thumbAsset,
                      key: ValueKey(thumbAsset),
                      width: thumbWidth,
                      height: thumbWidth,
                    ),
                  )
                else
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOutCubic,
                    left: position - thumbWidth / 2,
                    top: -2,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 350),
                      switchInCurve: Curves.easeInOut,
                      switchOutCurve: Curves.easeInOut,
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: ScaleTransition(
                            scale: animation,
                            child: child,
                          ),
                        );
                      },
                      child: Image.asset(
                        thumbAsset,
                        key: ValueKey(thumbAsset),
                        width: thumbWidth,
                        height: thumbWidth,
                      ),
                    ),
                  ),

                // Labels
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BuildLabel(
                        text: 'Bad',
                        index: 0,
                        value: selectedIndex,
                        primaryColor: widget.primaryColor,
                      ),
                      BuildLabel(
                        text: 'Not bad',
                        index: 1,
                        value: selectedIndex,
                        primaryColor: widget.primaryColor,
                      ),
                      BuildLabel(
                        text: 'Good',
                        index: 2,
                        value: selectedIndex,
                        primaryColor: widget.primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

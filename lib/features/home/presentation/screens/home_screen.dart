
import 'package:flutter/material.dart';

import '../../../../core/constants/experience_colors.dart';
import '../widgets/experience_bottom_bar.dart';
import '../widgets/experience_face.dart';
import '../widgets/experience_header.dart';
import '../widgets/experience_label.dart';
import '../widgets/experience_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double sliderValue = 0;

  int get selectedValue => sliderValue.round();

  ExperienceColors get currentColors =>
      ExperienceColors.fromValue(selectedValue);

  void _onSliderChanged(double value) {
    setState(() {
      sliderValue = value;
    });
  }

  void _onSubmit() {
    // Handle experience submission.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
        color: currentColors.background,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 20,
              children: [
                ExperienceHeader(
                  colors: currentColors,
                ),

                ExperienceFace(
                  selectedValue: selectedValue,
                  sliderValue: sliderValue,
                  colors: currentColors,
                ),

                ExperienceLabel(
                  selectedValue: selectedValue,
                  colors: currentColors,
                ),

                ExperienceSlider(
                  value: sliderValue,
                  primaryColor: currentColors.primary,
                  trackColor: currentColors.track,
                  onChanged: _onSliderChanged,
                ),

                const Spacer(),

                ExperienceBottomBar(
                  colors: currentColors,
                  onSubmit: _onSubmit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

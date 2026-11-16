
import 'package:flutter/material.dart';

class ExperienceColors {
  final Color background;
  final Color primary;
  final Color track;

  const ExperienceColors({
    required this.background,
    required this.primary,
    required this.track,
  });

  static const bad = ExperienceColors(
    background: Color(0xffFD8263),
    primary: Color(0xffAB3315),
    track: Color(0xffF9B8A7),
  );

  static const notBad = ExperienceColors(
    background: Color(0xffE1AD4B),
    primary: Color(0xffA36D08),
    track: Color(0xffF7D390),
  );

  static const good = ExperienceColors(
    background: Color(0xffAFC55C),
    primary: Color(0xff113600),
    track: Color(0xff96AB3B),
  );

  static ExperienceColors fromValue(int value) {
    switch (value) {
      case 0:
        return bad;
      case 1:
        return notBad;
      case 2:
        return good;
      default:
        return bad;
    }
  }
}

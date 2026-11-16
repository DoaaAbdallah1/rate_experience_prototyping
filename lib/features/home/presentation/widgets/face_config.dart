
class FaceConfig {
  final double eyeWidth;
  final double eyeHeight;
  final double eyeRadius;
  final double eyeTop;
  final double eyePosition;

  const FaceConfig({
    required this.eyeWidth,
    required this.eyeHeight,
    required this.eyeRadius,
    required this.eyeTop,
    required this.eyePosition,
  });

  factory FaceConfig.fromValue(int value) {
    return switch (value) {
      0 => const FaceConfig(
          eyeWidth: 74,
          eyeHeight: 74,
          eyeRadius: 37,
          eyeTop: 100,
          eyePosition: 70,
        ),
      1 => const FaceConfig(
          eyeWidth: 150,
          eyeHeight: 60,
          eyeRadius: 72,
          eyeTop: 100,
          eyePosition: 10,
        ),
      _ => const FaceConfig(
          eyeWidth: 140,
          eyeHeight: 140,
          eyeRadius: 70,
          eyeTop: 20,
          eyePosition: 20,
        ),
    };
  }
}

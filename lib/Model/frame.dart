import 'dart:ui';

class Frame {
  String assetPath;
  Offset offset;
  double size;
  double rotation;

  Frame({
    required this.assetPath,
    required this.offset,
    this.size = 200, // Default size of the frame
    this.rotation = 0,
  });
}

import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

class ImageUtils {
  static Future<Uint8List?> applyFilters({
    required Uint8List image,
    required double vignette,
    required double hdr,
    required double dehaze,
  }) async {
    ui.Image? inputImage;

    // Convert Uint8List image to ui.Image
    try {
      inputImage = await decodeImageFromList(image);
    } catch (e) {

      return null;


    }

    // Apply vignette effect
    if (vignette != 0.0) {
      inputImage = await applyVignette(inputImage, vignette);
    }

    // Apply HDR effect
    if (hdr != 0.0) {
      inputImage = applyHDR(inputImage, hdr);
    }

    // Apply dehaze effect
    if (dehaze != 0.0) {
      inputImage = applyDehaze(inputImage, dehaze);
    }

    // Convert ui.Image back to Uint8List
    ByteData? byteData = await inputImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List? processedImage = byteData?.buffer.asUint8List();

    return processedImage;
  }

  // Helper function to decode image from Uint8List
  static Future<ui.Image> decodeImageFromList(Uint8List list) async {
    final Completer<ui.Image> completer = Completer();
    ui.decodeImageFromList(list, (ui.Image img) {
      completer.complete(img);
    });
    return completer.future;
  }

  // Apply vignette effect
  static Future<ui.Image> applyVignette(ui.Image image, double vignette) async {
    final paint = ui.Paint()
      ..blendMode = ui.BlendMode.overlay
      ..shader = ui.ImageShader(
        image,
        ui.TileMode.clamp,
        ui.TileMode.clamp,
        Float64List.fromList([1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0]),
      );

    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder);
    canvas.drawImage(image, const ui.Offset(0, 0), paint);

    return recorder.endRecording().toImage(image.width, image.height);
  }

  // Apply HDR effect (Placeholder)
  static ui.Image applyHDR(ui.Image image, double hdr) {
    // Implement HDR effect logic (Placeholder)
    return image; // Placeholder implementation
  }

  // Apply dehaze effect (Placeholder)
  static ui.Image applyDehaze(ui.Image image, double dehaze) {
    // Implement dehaze effect logic (Placeholder)
    return image; // Placeholder implementation
  }
}

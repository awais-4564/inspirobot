import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;

class ImageEditScreen extends StatefulWidget {
  final File imageFile;
  final String originalPrompt;

  const ImageEditScreen({
    super.key,
    required this.imageFile,
    required this.originalPrompt,
  });

  @override
  ImageEditScreenState createState() => ImageEditScreenState();
}

class ImageEditScreenState extends State<ImageEditScreen> {
  late Uint8List _imageBytes;
  bool _isGrayscale = false;
  bool _isBlurred = false;
  double _brightness = 1.0;
  double _contrast = 1.0;

  @override
  void initState() {
    super.initState();
    // Load image bytes
    _imageBytes = widget.imageFile.readAsBytesSync();
  }

  // Image Processing Method
  Uint8List _processImage(Uint8List originalImage) {
    img.Image? image = img.decodeImage(originalImage);
    if (image == null) return originalImage;

    // Apply grayscale
    if (_isGrayscale) {
      image = img.grayscale(image);
    }

    // Apply blur
    if (_isBlurred) {
      image = img.gaussianBlur(image, 3); // Ensure 3 is an integer
    }

    // Adjust brightness and contrast
    image = img.brightness(image, ((255 * (_brightness - 1)).toInt()));
    image = img.contrast(image, ((_contrast - 1) * 128).toInt());

    return Uint8List.fromList(img.encodeJpg(image!));
  }

  // Save processed image
  Future<void> _saveProcessedImage() async {
    final processedBytes = _processImage(_imageBytes);

    // Save the processed image to a temporary directory
    final tempDir = await getTemporaryDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final file = File('${tempDir.path}/processed_image_$timestamp.jpg');
    await file.writeAsBytes(processedBytes);

    // Use the mounted check before accessing BuildContext
    if (mounted) {
      _showSnackbar('Image saved successfully!');
    }
  }

  // Show Snackbar
  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Image'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveProcessedImage,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Display Image
            Image.memory(
              _imageBytes,
              height: 300,
              fit: BoxFit.cover,
            ),

            // Original Prompt Display
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Original Prompt: ${widget.originalPrompt}',
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ),

            // Editing Controls
            SwitchListTile(
              title: const Text('Grayscale'),
              value: _isGrayscale,
              onChanged: (bool value) {
                setState(() => _isGrayscale = value);
              },
            ),

            SwitchListTile(
              title: const Text('Blur Effect'),
              value: _isBlurred,
              onChanged: (bool value) {
                setState(() => _isBlurred = value);
              },
            ),

            // Brightness Slider
            Text('Brightness: ${_brightness.toStringAsFixed(2)}'),
            Slider(
              value: _brightness,
              min: 0.0,
              max: 2.0,
              divisions: 20,
              label: _brightness.toStringAsFixed(2),
              onChanged: (value) {
                setState(() => _brightness = value);
              },
            ),

            // Contrast Slider
            Text('Contrast: ${_contrast.toStringAsFixed(2)}'),
            Slider(
              value: _contrast,
              min: 0.0,
              max: 2.0,
              divisions: 20,
              label: _contrast.toStringAsFixed(2),
              onChanged: (value) {
                setState(() => _contrast = value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

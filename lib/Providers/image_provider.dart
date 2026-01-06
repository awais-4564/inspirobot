import 'dart:typed_data';
import 'package:flutter/material.dart';

class AppImageProvider extends ChangeNotifier {
  Uint8List? _currentImage;
  bool _isLoading = false;
  String _debugMessage = '';

  // Getters
  Uint8List? get currentImage => _currentImage;
  bool get isLoading => _isLoading;
  String get debugMessage => _debugMessage;

  // Set a new image and notify listeners
  void setImage(Uint8List imageBytes) {
    _currentImage = imageBytes;
    _isLoading = false; // Stop loading when image is set
    _debugMessage = ''; // Clear any previous messages
    notifyListeners();
  }

  // Change the current image and notify listeners
  void changeImage(Uint8List compressedBytes) {
    _currentImage = compressedBytes;
    notifyListeners();
  }

  // Start the image generation process
  Future<void> generateImage(String prompt) async {
    if (prompt.isEmpty) {
      _debugMessage = 'Prompt cannot be empty.';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _debugMessage = ''; // Clear any error message
    notifyListeners();

    try {
      // Simulate image generation delay (replace with actual generation logic)
      await Future.delayed(const Duration(seconds: 3));
      // Assume imageBytes is the generated image
      Uint8List imageBytes = Uint8List(1024); // Replace with actual image data
      setImage(imageBytes);
    } catch (e) {
      _isLoading = false;
      _debugMessage = 'Failed to generate image. Please try again.';
      notifyListeners();
    }
  }

  // Clear the current image
  void clearImage() {
    _currentImage = null;
    notifyListeners();
  }
}

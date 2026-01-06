import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../Core/aa.dart';

class HomeProvider with ChangeNotifier {
  File? _generatedImageFile;
  String _debugMessage = '';
  bool _isLoading = false;

  File? get generatedImageFile => _generatedImageFile;
  String get debugMessage => _debugMessage;
  bool get isLoading => _isLoading;

  Future<File> _processAndCacheImage(Uint8List imageBytes) async {
    final tempDir = await getTemporaryDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final file = File('${tempDir.path}/generated_image_$timestamp.png'); // Changed to .png
    await file.writeAsBytes(imageBytes);
    return file;
  }

  Future<void> generateImage(String prompt) async {
    if (prompt.trim().isEmpty) {
      _debugMessage = 'Please enter a valid prompt';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _debugMessage = '';
    notifyListeners();

    try {
      final aiService = AIImageService();
      final generatedFile = await aiService.generateImage(prompt: prompt);

      // Read the file back into bytes (to pass through your caching system)
      final imageBytes = await generatedFile.readAsBytes();
      final cachedImageFile = await _processAndCacheImage(imageBytes);

      _generatedImageFile = cachedImageFile;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _debugMessage = 'Error: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearState() {
    _generatedImageFile = null;
    _debugMessage = '';
    notifyListeners();
  }
}
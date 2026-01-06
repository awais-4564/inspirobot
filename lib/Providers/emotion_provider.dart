import 'package:flutter/material.dart';

import '../Core/emotionrecognition.dart';

class EmotionRecognitionProvider with ChangeNotifier {
  String _detectedEmotion = "";
  bool _isLoading = false;

  String get detectedEmotion => _detectedEmotion;
  bool get isLoading => _isLoading;

  final EmotionRecognitionService _emotionService = EmotionRecognitionService();

  Future<void> detectEmotion(String inputText) async {

    if (inputText.isEmpty) {
      _detectedEmotion = "Please enter some text.";
      notifyListeners();
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      // Call the service to get the emotion
      final emotion = await _emotionService.getEmotion(inputText);


      // Check if emotion is received properly
      if (emotion == "Emotion field is missing in response.") {
        _detectedEmotion = "No emotion detected. Please try again.";
      } else {
        _detectedEmotion = emotion;
      }
    } catch (e) {
      _detectedEmotion = "Error: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

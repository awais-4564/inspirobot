import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/emotion_provider.dart';

class EmotionRecognitionScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  EmotionRecognitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emotionProvider = Provider.of<EmotionRecognitionProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF0F172A), // Dark background

      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A), // Dark background

        title:
        const Text(
          "Emotion Recognition",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: "Describe your feelings here...",
                filled: true,
                fillColor: const Color(0xFF293651),
                hintStyle: TextStyle(color: Colors.grey[400]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              maxLines: 3,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_textController.text.trim().isNotEmpty) {
                    emotionProvider.detectEmotion(_textController.text.trim());
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter some text!")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4F5DBF),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Detect Emotion",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 32),
            if (emotionProvider.isLoading)
              const Center(child: CircularProgressIndicator())
            else
              Center(
                child: Text(
                  emotionProvider.detectedEmotion.isEmpty
                      ? "Emotion will be displayed here."
                      : "Detected Emotion: ${emotionProvider.detectedEmotion}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;

class EmotionRecognitionService {
  final String geminiApiKey = "AIzaSyAVIfUEFy8Q7MRgoK4mX149XqBzQApMSEs";

  Future<String> getEmotion(String inputText) async {
    try {
      final response = await http.post(
        Uri.parse(
          "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$geminiApiKey",
        ),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": "What emotion is in this text? Reply with just one word: happy, sad, angry, or neutral. Text: '$inputText'"}
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final emotion = data['candidates'][0]['content']['parts'][0]['text'].trim().toLowerCase();

        // Simple validation
        if (['happy', 'sad', 'angry'].contains(emotion)) {
          return emotion;
        }
        return 'neutral';
      } else {
        return 'neutral';
      }
    } catch (e) {
      return 'neutral';
    }
  }
}
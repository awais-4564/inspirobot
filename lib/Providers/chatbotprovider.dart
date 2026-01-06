import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatBotProvider extends ChangeNotifier {
  final TextEditingController controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  bool _isLoading = false;

  // Replace with your actual Gemini API key
  final String geminiApiKey = "AIzaSyAVIfUEFy8Q7MRgoK4mX149XqBzQApMSEs";

  List<Map<String, dynamic>> get messages => _messages;
  bool get isLoading => _isLoading;

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    // Add user message to the chat
    _messages.add({'text': text, 'isUser': true});
    _isLoading = true;
    notifyListeners();

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
                {"text": text}
              ]
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final reply = data['candidates'][0]['content']['parts'][0]['text'].trim();

        _messages.add({'text': reply, 'isUser': false});
      } else {
        _messages.add({
          'text': "Error: ${response.statusCode} - ${response.body}",
          'isUser': false
        });
      }
    } catch (e) {
      _messages.add({'text': "Error: $e", 'isUser': false});
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
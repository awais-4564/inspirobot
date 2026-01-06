import 'package:flutter/material.dart';
import '../Screens/ChatBot/chatbot.dart';
import '../Screens/EmotionRecognition/imagerecognitionsystem.dart';
import '../Screens/TextToImage/aiimagegeneratorscreen.dart';
import '../Screens/LanguageTralnslate/languagetranslate.dart';

enum HomeType { aiChatBot, aiImage, aiTranslator, newFeature }

extension MyHomeType on HomeType {
  // Title
  String get title => switch (this) {
    HomeType.aiImage => 'AI Image Creator',

    HomeType.aiChatBot => 'AI ChatBot',
    HomeType.aiTranslator => 'Language Translator',
    HomeType.newFeature => 'Emotion Recognition',
  };

  // Lottie
  String get lottie => switch (this) {
    HomeType.aiImage => 'ai_play.json',
    HomeType.aiChatBot => 'ai_hand_waving.json',

    HomeType.aiTranslator => 'ai_ask_me.json',
    HomeType.newFeature => 'ai_play.json', // Replace with your Lottie file
  };

  // For alignment
  bool get leftAlign => switch (this) {
    HomeType.aiImage => false,
    HomeType.aiChatBot => true,

    HomeType.aiTranslator => true,
    HomeType.newFeature => false,
  };

  // For padding
  EdgeInsets get padding => switch (this) {
    HomeType.aiChatBot => EdgeInsets.zero,
    HomeType.aiImage => const EdgeInsets.all(20),
    HomeType.aiTranslator => EdgeInsets.zero,
    HomeType.newFeature => const EdgeInsets.all(10),
  };

  // For navigation
  void navigatorPush(BuildContext context) {
    switch (this) {
      case HomeType.aiChatBot:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) =>  const ChatScreen()),
        );
        break;
      case HomeType.aiImage:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) =>  AIImageGenerator()),
        );
        break;
      case HomeType.aiTranslator:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const TranslateScreen()),
        );
        break;
      case HomeType.newFeature:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) =>  EmotionRecognitionScreen()), // Replace with your new screen
        );
        break;
    }
  }
}


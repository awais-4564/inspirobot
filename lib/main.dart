import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Constants/colors.dart';
import 'Providers/chatbotprovider.dart';
import 'Providers/emotion_provider.dart';
import 'Providers/image_provider.dart';
import 'Providers/translaterprovider.dart';
import 'Screens/SplashScreen/splash_screen.dart';
import 'providers/home_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => AppImageProvider()),
        ChangeNotifierProvider(create: (_) => ChatBotProvider()),
        ChangeNotifierProvider(create: (_) => EmotionRecognitionProvider()),
        ChangeNotifierProvider(create: (_) => TranslateProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'AI Image Generator',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: AppColors.bgColor),
          scaffoldBackgroundColor: AppColors.bgColor), // Use a dark theme
      home: const SplashScreen(),
    );
  }
}

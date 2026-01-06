import 'package:flutter/material.dart';
import '../../CommonWidgets/custom_loading.dart';
import '../OnBoarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Wait for 2 seconds, then navigate to the OnboardingScreen
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Initializing device size
    var mq = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            // For adding some space
            //const Spacer(flex: 1),

            // Logo
            Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.all(mq.width * .05),
                child: Image.asset(
                  'images/logo.png',
                  width: mq.width * .4,
                ),
              ),
            ),

            // For adding some space
            const Spacer(),

            // Lottie loading or any loading widget
            const CustomLoading(),

            // For adding some space
            //const Spacer(),
          ],
        ),
      ),
    );
  }
}

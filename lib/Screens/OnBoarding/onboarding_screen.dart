
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../Model/onboard.dart';
import '../../Widgets/custombtn.dart';
import '../../Widgets/detailstext1.dart';
import '../Home/home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final list = [
      // onboarding 1
      Onboard(
        title: 'Ask me Anything',
        subtitle:
        'I can be your Best Friend & You can ask me anything & I will help you!',
        lottie: 'ai_ask_me',
      ),

      // onboarding 2
      Onboard(
        title: 'Imagination to Reality',
        lottie: 'ai_play',
        subtitle:
        'Just Imagine anything & let me know, I will create something wonderful for you!',
      ),
    ];

    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: list.length,
        itemBuilder: (ctx, ind) {
          final isLast = ind == list.length - 1;

          return Column(
            children: [
              // Lottie
              Lottie.asset(
                'assets/lottie/${list[ind].lottie}.json',
                height: MediaQuery.of(context).size.height * .6,
                width: isLast ? MediaQuery.of(context).size.width * .7 : null,
              ),

              // Title
              Text(
                list[ind].title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    letterSpacing: .5),
              ),

              // Space
              SizedBox(height: MediaQuery.of(context).size.height * .015),

              // Subtitle
              SizedBox(
                width: MediaQuery.of(context).size.width * .7,
                child: Text1(
                text1:   list[ind].subtitle,
                  size: 15,

              ),
              ),

               const Spacer(),

              // Dots
              Wrap(
                spacing: 10,
                children: List.generate(
                  list.length,
                      (i) => Container(
                    width: i == ind ? 15 : 10,
                    height: 8,
                    decoration: BoxDecoration(
                      color: i == ind ? Colors.blue : Colors.grey,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: CustomButton(
                  onTap: () {
                    if (isLast) {
                      // Navigate to HomeScreen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                    } else {
                      // Move to the next page
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.ease,
                      );
                    }
                  },
                  text: isLast ? 'Finish' : 'Next',
                ),
              ),

              const Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }
}

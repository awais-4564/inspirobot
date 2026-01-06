import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import '../Model/home_type.dart';
import 'global.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;

  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;

    return Card(
      color: const Color(0xFF293651),
      elevation: 0,
      margin: EdgeInsets.only(bottom: mq.height * .02),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        onTap: () => homeType.navigatorPush(context),
        child: homeType.leftAlign
            ? Row(
          children: [
            // Lottie Animation
            Container(
              width: mq.width * .35,
              padding: homeType.padding,
              child: Lottie.asset('assets/lottie/${homeType.lottie}'),
            ),
            const Spacer(),
            // Title
            Text(
              homeType.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
            const Spacer(flex: 2),
          ],
        )
            : Row(
          children: [
            const Spacer(flex: 2),
            // Title
            Text(
              homeType.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
            const Spacer(),
            // Lottie Animation
            Container(
              width: mq.width * .35,
              padding: homeType.padding,
              child: Lottie.asset('assets/lottie/${homeType.lottie}'),
            ),
          ],
        ),
      ),
    ).animate().fade(duration: 1.seconds, curve: Curves.easeIn);
  }
}

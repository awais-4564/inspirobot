import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../CommonWidgets/global.dart';
import '../../CommonWidgets/home_card.dart';
import '../../Model/home_type.dart';
import '../../Widgets/detailstext1.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    // Initializing device size
    mq = MediaQuery.sizeOf(context);

    return Scaffold(
      // App bar
      appBar: AppBar(
        centerTitle: true,
        title: const Text1(text1: 'Home', size: 40),
      ),

      // Body
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: mq.width * .04,
          vertical: mq.height * .015,
        ),
        children: HomeType.values.map((e) => HomeCard(homeType: e)).toList(),
      ),
    );
  }
}

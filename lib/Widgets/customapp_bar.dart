import 'package:flutter/material.dart';

import 'detailstext1.dart';

class CustomAppBar extends StatelessWidget {
  final String text;

  const CustomAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black54,
          size: 20,
        ),
        Text1(text1: text),
        const Text1(text1: '')
      ],
    );
  }
}

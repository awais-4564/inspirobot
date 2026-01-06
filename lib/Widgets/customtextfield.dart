import 'package:flutter/material.dart';

import '../Constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData? icon, icon2;
  final int? maxlines;
  final double height;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const CustomTextField({super.key,
    required this.label,
    this.icon,
    this.icon2,
    this.maxlines,
    this.height = 41,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 4),
      width: double.infinity,
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.textFormFieldBorderColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(

        controller: controller,
        onChanged: onChanged,
        maxLines: maxlines,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: label,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: -3),
          hintStyle: const TextStyle(color: Colors.white, fontSize: 12),
          prefixIcon: Icon(
            icon,
            size: 20,
            color: Colors.white,
          ),
          suffixIcon: Icon(
            icon2,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pixel_color_picker/pixel_color_picker.dart';

import '../Widgets/custombtn.dart';

class PixelColorImage {
  show(BuildContext context, {Color? backgroundColor, Uint8List? image, onPick}) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          Color tempColor = backgroundColor!;

          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: const Text('Move your finger'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PixelColorPicker(
                      child: Image.memory(image!),
                      onChanged: (color) {
                        setState(() {
                          tempColor = color;
                        });
                      }),
                  const SizedBox(height: 10,),
                  Container(
                    width: double.infinity,
                    height: 80,
                    color: tempColor,
                  )
                ],
              ),
              actions: [
                CustomButton(text: 'Cancel',
                    onTap:(){
                      onPick(tempColor);
                      Navigator.of(context).pop();

                })



              ],
            );
          });
        });
  }
}

import 'dart:typed_data';
import 'package:colorfilter_generator/addons.dart';
import 'package:colorfilter_generator/colorfilter_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Constants/colors.dart';
import '../../Providers/image_provider.dart';
import '../../Widgets/detailstext1.dart';

class AdjustScreen extends StatefulWidget {
  final File imageFile;

  const AdjustScreen({super.key, required this.imageFile});

  @override
  State<AdjustScreen> createState() => _AdjustScreenState();
}

class _AdjustScreenState extends State<AdjustScreen> {
  double brightness = 0;
  double contrast = 0;
  double saturation = 0;
  double hue = 0;
  double sepia = 0;

  late ColorFilterGenerator adj;
  late AppImageProvider imageProvider;
  ScreenshotController screenshotController = ScreenshotController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    imageProvider = Provider.of<AppImageProvider>(context, listen: false);
    adjust();
  }

  void adjust({double? b, double? c, double? s, double? h, double? se}) {
    adj = ColorFilterGenerator(name: 'Adjust', filters: [
      ColorFilterAddons.brightness(b ?? brightness),
      ColorFilterAddons.contrast(c ?? contrast),
      ColorFilterAddons.saturation(s ?? saturation),
      ColorFilterAddons.hue(h ?? hue),
      ColorFilterAddons.sepia(se ?? sepia),
    ]);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(color: Colors.white),
        title: const Text1(text1: 'Adjust', size: 20),

      ),
      body: Stack(
        children: [
          Center(
            child: Consumer<AppImageProvider>(
              builder: (context, value, child) {
                if (value.currentImage != null) {
                  return Screenshot(
                    controller: screenshotController,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.matrix(adj.matrix),
                      child: Image.file(widget.imageFile),
                    ),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                _sliderColumn(
                  "Brightness",
                  value: brightness,
                  onChanged: (val) => setState(() {
                    brightness = val;
                    adjust(b: brightness);
                  }),
                ),
                _sliderColumn(
                  "Contrast",
                  value: contrast,
                  onChanged: (val) => setState(() {
                    contrast = val;
                    adjust(c: contrast);
                  }),
                ),
                _sliderColumn(
                  "Saturation",
                  value: saturation,
                  onChanged: (val) => setState(() {
                    saturation = val;
                    adjust(s: saturation);
                  }),
                ),
                _sliderColumn(
                  "Hue",
                  value: hue,
                  onChanged: (val) => setState(() {
                    hue = val;
                    adjust(h: hue);
                  }),
                ),
                _sliderColumn(
                  "Sepia",
                  value: sepia,
                  onChanged: (val) => setState(() {
                    sepia = val;
                    adjust(se: sepia);
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 150,
        color: AppColors.tabColor,
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                brightness = 0;
                contrast = 0;
                saturation = 0;
                hue = 0;
                sepia = 0;
                adjust();
              });
            },
            child: const Text("Reset Adjustments"),
          ),
        ),
      ),
    );
  }

  Widget _sliderColumn(String label, {required double value, required ValueChanged<double> onChanged}) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(color: Colors.white)),
          Slider(
            value: value,
            min: -1,
            max: 1,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

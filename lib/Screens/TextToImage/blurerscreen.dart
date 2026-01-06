import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:http/http.dart' as http;

import '../../Constants/colors.dart';
import '../../Providers/image_provider.dart';
import '../../Widgets/detailstext1.dart';

class BlurScreen extends StatefulWidget {
  final File imageFile;

  const BlurScreen({super.key, required this.imageFile});

  @override
  State<BlurScreen> createState() => _BlurScreenState();
}

class _BlurScreenState extends State<BlurScreen> {
  late AppImageProvider imageProvider;
  ScreenshotController screenshotController = ScreenshotController();
  double sigmaX = 0.1;
  double sigmaY = 0.1;
  TileMode tileMode = TileMode.decal;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    imageProvider = Provider.of<AppImageProvider>(context, listen: false);
  }

  Future<void> _captureAndHandleScreenshot() async {
    setState(() {
      isLoading = true;
    });

    try {
      // Capture screenshot
      Uint8List? bytes = await screenshotController.capture();
      if (bytes != null) {
        final directory = await Directory.systemTemp.createTemp();
        final file = File('${directory.path}/screenshot.png');
        await file.writeAsBytes(bytes);
        _handlePostAsyncActions(file);
      }
    } catch (e) {
      _showSnackbar("Failed to capture image: $e", isError: true);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }



  void _handlePostAsyncActions(File file) {
    if (mounted && file.existsSync()) {
      imageProvider.changeImage(file.readAsBytesSync());
      Navigator.of(context).pop();
    }
  }

  void _showSnackbar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(color: Colors.white),
        title: const Text1(text1: 'Blur', size: 18),

      ),
      body: Stack(
        children: [
          Center(
            child: Consumer<AppImageProvider>(
              builder: (context, value, child) {
                if (value.currentImage != null) {
                  return Screenshot(
                    controller: screenshotController,
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: sigmaX,
                        sigmaY: sigmaY,
                        tileMode: tileMode,
                      ),
                      child: Image.memory(value.currentImage!),
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      const Text1(text1: 'X:', color: Colors.green),
                      Expanded(
                        child: slider(
                          value: sigmaX,
                          onChanged: (value) => setState(() => sigmaX = value),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text1(text1: 'Y:'),
                      Expanded(
                        child: slider(
                          value: sigmaY,
                          onChanged: (value) => setState(() => sigmaY = value),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget slider({required double value, required ValueChanged<double> onChanged}) {
    return Slider(
      value: value,
      min: 0.1,
      max: 10.0,
      divisions: 100,
      label: value.toStringAsFixed(2),
      onChanged: onChanged,
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 160,
      color: AppColors.tabColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _bottomBarItem('Decal', tileMode == TileMode.decal),
          _bottomBarItem('Clamp', tileMode == TileMode.clamp),
          _bottomBarItem('Mirror', tileMode == TileMode.mirror),
          _bottomBarItem('Repeated', tileMode == TileMode.repeated),
        ],
      ),
    );
  }

  Widget _bottomBarItem(String title, bool isActive) {
    return InkWell(
      onTap: () {
        setState(() {
          tileMode = TileMode.values.firstWhere((mode) => mode.name == title.toLowerCase());
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.blur_on, color: isActive ? Colors.blue : Colors.white),
          Text1(
            text1: title,
            color: isActive ? Colors.blue : Colors.white,
          ),
        ],
      ),
    );
  }
}

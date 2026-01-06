import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

import '../../Constants/colors.dart'; // Custom colors file
import '../../Providers/image_provider.dart'; // Custom provider file
import '../../Widgets/detailstext1.dart'; // Custom Text widget file
import '../../model/frame.dart'; // Frame model

class FramesScreen extends StatefulWidget {
  final File imageFile; // Pass the selected image file to this screen

  const FramesScreen({super.key, required this.imageFile});

  @override
  FramesScreenState createState() => FramesScreenState();
}

class FramesScreenState extends State<FramesScreen> {
  late AppImageProvider imageProvider;
  ScreenshotController screenshotController = ScreenshotController();
  List<Frame> frames = [];
  Frame? selectedFrame;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      imageProvider = Provider.of<AppImageProvider>(context, listen: false);
      try {
        final imageBytes = widget.imageFile.readAsBytesSync();
        imageProvider.changeImage(imageBytes);
      } catch (e) {
        if (kDebugMode) {
          print("Error loading image: $e");
        }
      }
    });
  }

  Future<void> _captureAndHandleScreenshot() async {
    Uint8List? bytes = await screenshotController.capture();

    if (bytes != null) {
      _handlePostAsyncActions(bytes);
    }
  }

  void _handlePostAsyncActions(Uint8List bytes) {
    if (mounted) {
      imageProvider.changeImage(bytes);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(
          color: Colors.white,
        ),
        title: const Text1(
          text1: 'Frames',
          size: 18,
        ),
        actions: [
          IconButton(
            onPressed: _captureAndHandleScreenshot,
            icon: const Icon(
              Icons.done,
              color: AppColors.text3Color,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Consumer<AppImageProvider>(
              builder: (BuildContext context, value, Widget? child) {
                if (value.currentImage != null) {
                  return Screenshot(
                    controller: screenshotController,
                    child: Stack(
                      children: [
                        Image.memory(value.currentImage!), // Display the loaded image
                        for (var frame in frames)
                          Positioned(
                            left: frame.offset.dx,
                            top: frame.offset.dy,
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                setState(() {
                                  frame.offset += details.delta;
                                });
                              },
                              onTap: () {
                                setState(() {
                                  selectedFrame = frame;
                                });
                              },
                              child: Transform.rotate(
                                angle: frame.rotation,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: selectedFrame == frame
                                        ? Border.all(color: Colors.white, width: 3)
                                        : null,
                                  ),
                                  child: Image.asset(
                                    frame.assetPath,
                                    width: frame.size,
                                    height: frame.size,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          if (selectedFrame != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.green, size: 50),
                      onPressed: () {
                        setState(() {
                          frames.remove(selectedFrame);
                          selectedFrame = null;
                        });
                      },
                    ),
                    Slider(
                      value: selectedFrame!.size,
                      min: 100,
                      max: 400,
                      onChanged: (value) {
                        setState(() {
                          selectedFrame!.size = value;
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.rotate_right, color: Colors.green, size: 50),
                      onPressed: () {
                        setState(() {
                          selectedFrame!.rotation += 0.1;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 180,
        color: AppColors.tabColor,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (var assetPath in _frameAssets)
              GestureDetector(
                onTap: () {
                  setState(() {
                    frames.add(Frame(
                      assetPath: assetPath,
                      offset: const Offset(100, 100),
                      size: 200,
                    ));
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(assetPath, width: 50, height: 70),
                ),
              ),
          ],
        ),
      ),
    );
  }

  final List<String> _frameAssets = [
    'images/f1.png',
    'images/f2.png',
    'images/f3.png',
    'images/f4.png',
    'images/f5.png',
    'images/f6.png',
    'images/f7.png',
  ];
}

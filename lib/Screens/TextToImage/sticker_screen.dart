import 'dart:io'; // Import for File
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import '../../Constants/colors.dart';
import '../../Providers/image_provider.dart';
import '../../Widgets/detailstext1.dart';

class StickerScreen extends StatefulWidget {
  final File imageFile; // Accept a File instead of Uint8List

  const StickerScreen({super.key, required this.imageFile});

  @override
  StickerScreenState createState() => StickerScreenState();
}

class StickerScreenState extends State<StickerScreen> {
  late AppImageProvider imageProvider;
  ScreenshotController screenshotController = ScreenshotController();
  List<Sticker> stickers = [];
  Sticker? selectedSticker;

  @override
  void initState() {
    super.initState();
    imageProvider = Provider.of<AppImageProvider>(context, listen: false);
  }

  Future<void> _captureAndHandleScreenshot() async {
    // Capture the screenshot
    Uint8List? bytes = await screenshotController.capture();

    // Use a local variable to store context if needed
    if (bytes != null) {
      // Call a method to handle the post-async actions
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
          text1: 'Stickers',
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
                if (widget.imageFile.existsSync()) {
                  return Screenshot(
                    controller: screenshotController,
                    child: Stack(
                      children: [
                        Image.file(widget.imageFile), // Display the image file passed in
                        for (var sticker in stickers)
                          Positioned(
                            left: sticker.offset.dx,
                            top: sticker.offset.dy,
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                setState(() {
                                  sticker.offset += details.delta;
                                });
                              },
                              onTap: () {
                                setState(() {
                                  selectedSticker = sticker;
                                });
                              },
                              child: Transform.rotate(
                                angle: sticker.rotation,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: selectedSticker == sticker
                                        ? Border.all(
                                        color: Colors.blue, width: 2)
                                        : null,
                                  ),
                                  child: Image.asset(
                                    sticker.assetPath,
                                    width: sticker.size,
                                    height: sticker.size,
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
          if (selectedSticker != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        setState(() {
                          stickers.remove(selectedSticker);
                          selectedSticker = null;
                        });
                      },
                    ),
                    Slider(
                      value: selectedSticker!.size,
                      min: 50,
                      max: 200,
                      onChanged: (value) {
                        setState(() {
                          selectedSticker!.size = value;
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.rotate_right),
                      onPressed: () {
                        setState(() {
                          selectedSticker!.rotation += 0.1;
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
        height: 170,
        color: AppColors.tabColor,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (var assetPath in _stickerAssets)
              GestureDetector(
                onTap: () {
                  setState(() {
                    stickers.add(Sticker(
                      assetPath: assetPath,
                      offset: const Offset(100, 100),
                    ));
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(assetPath, width: 50, height: 50),
                ),
              ),
          ],
        ),
      ),
    );
  }

  final List<String> _stickerAssets = [
    'images/creativity.png',
    'images/fox.png',
    'images/listening.png',
    'images/man.png',
    'images/crying-baby.png',
    'images/guitar.png',
    'images/happy-face.png',
    // Add more sticker paths here
  ];
}

class Sticker {
  String assetPath;
  Offset offset;
  double size;
  double rotation;

  Sticker({
    required this.assetPath,
    required this.offset,
    this.size = 100,
    this.rotation = 0,
  });
}

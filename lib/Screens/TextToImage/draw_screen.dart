import 'dart:io'; // Import for File
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:painter/painter.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

import '../../Constants/colors.dart';
import '../../Helper/color_picker.dart';
import '../../Helper/pixel_color_image.dart';
import '../../Providers/image_provider.dart';
import '../../Widgets/detailstext1.dart'; // Optional, if you're picking image files



class DrawScreen extends StatefulWidget {
  final File imageFile; // Declare the imageFile property

  const DrawScreen({super.key, required this.imageFile}); // Constructor with required imageFile

  @override
  State<DrawScreen> createState() => _DrawScreenState();
}

class _DrawScreenState extends State<DrawScreen> {
  late AppImageProvider imageProvider;

  final ScreenshotController screenshotController = ScreenshotController();
  final PainterController controller = PainterController();
  File? currentImageFile;

  @override
  void initState() {
    super.initState();
    imageProvider = Provider.of<AppImageProvider>(context, listen: false);

    controller.thickness = 5.0;
    controller.backgroundColor = Colors.transparent;
  }

  Future<void> _captureAndSaveImage() async {
    try {
      final Uint8List? bytes = await screenshotController.capture();
      if (bytes != null) {
        imageProvider.changeImage(bytes);
        if (mounted) {
          Navigator.of(context).pop();
        }
      }
    } catch (e) {
      // Handle any errors here
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
          text1: 'Draw',
          size: 18,
        ),
        actions: [
          IconButton(
            onPressed: _captureAndSaveImage,
            icon: const Icon(
              Icons.done,
              color: AppColors.text3Color,
              size: 28,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Consumer<AppImageProvider>(
              builder: (BuildContext context, value, Widget? child) {
                currentImageFile = widget.imageFile; // Use the passed imageFile

                return Screenshot(
                  controller: screenshotController,
                  child: Stack(
                    children: [
                      Image.file(
                        widget.imageFile, // Display the passed imageFile
                      ),
                      Positioned.fill(
                        child: Painter(controller),
                      ),
                    ],
                  ),
                );
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
                      SizedBox(
                        width: 20,
                        child: Center(
                          child: Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: controller.thickness + 3,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Slider(
                          label: controller.thickness.toStringAsFixed(2),
                          value: controller.thickness,
                          max: 20,
                          min: 1,
                          onChanged: (value) {
                            setState(() {
                              controller.thickness = value;
                            });
                          },
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
      bottomNavigationBar: BottomAppBar(
        color: AppColors.tabColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _bottomBarItem(
              icon: Icons.create,
              onPressed: () {
                setState(() {
                  controller.eraseMode = !controller.eraseMode;
                });
              },
              rotate: controller.eraseMode,
            ),
            _bottomBarItem(
              icon: Icons.color_lens_outlined,
              onPressed: () {
                AppColorrPickerr().show(
                  context,
                  backgroundColor: controller.drawColor,
                  onPick: (color) {
                    setState(() {
                      controller.drawColor = color;
                    });
                  },
                );
              },
            ),
            _bottomBarItem(
              icon: Icons.colorize,
              onPressed: () {
                PixelColorImage().show(
                  context,
                  backgroundColor: controller.drawColor,
                  image: currentImageFile?.readAsBytesSync(),
                  onPick: (color) {
                    setState(() {
                      controller.drawColor = color;
                    });
                  },
                );
              },
            ),
            _bottomBarItem(
              icon: Icons.undo,
              onPressed: controller.undo,
            ),
            _bottomBarItem(
              icon: Icons.delete,
              onPressed: controller.clear,
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomBarItem({
    required IconData icon,
    required VoidCallback onPressed,
    bool rotate = false,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotatedBox(
                quarterTurns: rotate ? 2 : 0,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

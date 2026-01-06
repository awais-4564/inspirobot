import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crop_image/crop_image.dart';
import 'package:http/http.dart' as http;

import '../../Constants/colors.dart';
import '../../Providers/image_provider.dart';
import '../../Widgets/detailstext1.dart';

class CropImageScreen extends StatefulWidget {
  final File imageFile;

  const CropImageScreen({super.key, required this.imageFile});

  @override
  CropImageScreenState createState() => CropImageScreenState();
}

class CropImageScreenState extends State<CropImageScreen> {
  final CropController controller = CropController(
    aspectRatio: 1,
    defaultCrop: const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9),
  );

  @override
  void initState() {
    super.initState();
    _initializeImage();
  }

  void _initializeImage() async {
    final Uint8List imageBytes = await widget.imageFile.readAsBytes();
    if (mounted) {
      Provider.of<AppImageProvider>(context, listen: false).setImage(imageBytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(color: Colors.white),
        title: const Text1(text1: 'Crop Image', size: 18),

      ),
      body: Center(
        child: Consumer<AppImageProvider>(
          builder: (context, imageProvider, child) {
            if (imageProvider.currentImage != null) {
              return CropImage(
                controller: controller,
                image: Image.memory(imageProvider.currentImage!),
                gridCornerSize: 50,
                showCorners: true,
                gridThinWidth: 3,
                gridThickWidth: 6,
                scrimColor: Colors.blueGrey.withOpacity(0.5),
                alwaysShowThirdLines: true,
                minimumImageSize: 50,
                maximumImageSize: 2000,
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }



  Widget _buildBottomNavigationBar() {
    return Container(
      height: 150,
      color: AppColors.tabColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: _buildBottomBarItems(),
        ),
      ),
    );
  }

  List<Widget> _buildBottomBarItems() {
    return [
      _bottomBarItem(
        icon: Icons.rotate_90_degrees_ccw,
        onPressed: () => controller.rotateLeft(),
      ),
      _bottomBarItem(
        icon: Icons.rotate_90_degrees_cw,
        onPressed: () => controller.rotateRight(),
      ),
      _divider(),
      _aspectRatioItem('Free', null),
      _aspectRatioItem('1:1', 1),
      _aspectRatioItem('2:1', 2),
      _aspectRatioItem('1:2', 0.5),
      _aspectRatioItem('4:3', 4 / 3),
      _aspectRatioItem('3:4', 3 / 4),
      _aspectRatioItem('16:9', 16 / 9),
      _aspectRatioItem('9:16', 9 / 16),
    ];
  }

  Widget _bottomBarItem({required IconData icon, required VoidCallback onPressed}) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      iconSize: 28,
    );
  }

  Widget _divider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.grey.withOpacity(0.6),
      margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }

  Widget _aspectRatioItem(String label, double? aspectRatio) {
    return TextButton(
      onPressed: () {
        controller.aspectRatio = aspectRatio;
      },
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }

  void _showErrorSnackbar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  void _showSuccessSnackbar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.green,
        ),
      );
    }
  }
}

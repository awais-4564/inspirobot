import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:provider/provider.dart';

import '../../Providers/image_provider.dart';
import '../../Widgets/detailstext1.dart';

class CompressImageScreen extends StatefulWidget {
  final File imageFile;

  const CompressImageScreen({super.key, required this.imageFile});

  @override
  CompressImageScreenState createState() => CompressImageScreenState();
}

class CompressImageScreenState extends State<CompressImageScreen> {
  late AppImageProvider imageProvider;
  bool isProcessing = false;
  int originalSize = 0;
  int processedSize = 0;

  @override
  void initState() {
    super.initState();
    imageProvider = Provider.of<AppImageProvider>(context, listen: false);
    _initializeImage();
  }

  void _initializeImage() async {
    try {
      final Uint8List imageBytes = await widget.imageFile.readAsBytes();
      imageProvider.setImage(imageBytes);
      setState(() {
        originalSize = imageBytes.lengthInBytes;
      });
      // Automatically compress image on initialization
      await processImage(imageBytes);
    } catch (e) {
      _showErrorSnackbar('Error initializing image: $e');
    }
  }

  Future<void> processImage(Uint8List imageData) async {
    setState(() {
      isProcessing = true;
    });

    try {
      // Compress the image
      final compressedImage = await FlutterImageCompress.compressWithList(
        imageData,
        minWidth: 1920,
        minHeight: 1080,
        quality: 80,
        rotate: 0,
      );

      setState(() {
        processedSize = compressedImage.lengthInBytes;
      });

      imageProvider.changeImage(compressedImage);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Image compressed successfully\n'
                  'Original Size: ${(originalSize / 1024).toStringAsFixed(2)} KB\n'
                  'Compressed Size: ${(processedSize / 1024).toStringAsFixed(2)} KB',
            ),
          ),
        );
      }
    } catch (e) {
      _showErrorSnackbar('Error compressing image: $e');
    } finally {
      if (mounted) {
        setState(() {
          isProcessing = false;
        });
      }
    }
  }

  void _showErrorSnackbar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(color: Colors.white),
        title: const Text1(text1: 'Compress Image', size: 18),
      ),
      body: Center(
        child: Consumer<AppImageProvider>(
          builder: (BuildContext context, value, Widget? child) {
            if (value.currentImage != null) {
              return Center(
                child: Image.memory(value.currentImage!),
              );
            }
            return const Center(
              child: Text('No image available'),
            );
          },
        ),
      ),
      bottomNavigationBar: isProcessing
          ? Container(
        color: Colors.black,
        height: 60,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      )
          : null,
    );
  }
}
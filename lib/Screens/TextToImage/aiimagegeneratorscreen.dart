import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/home_provider.dart';
import 'adjustimage.dart';
import 'blurerscreen.dart';
import 'cropimagescreen.dart';
import 'draw_screen.dart';
import 'frames_screen.dart';
import 'imagecompressscreen.dart';
import 'sticker_screen.dart';

class AIImageGenerator extends StatelessWidget {
  final TextEditingController _promptController = TextEditingController();

  AIImageGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Dark background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                "Text To Image Generator",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Show prompt input and generate button only if no image is generated or it's loading
              if (homeProvider.generatedImageFile == null && !homeProvider.isLoading) ...[
                _buildPromptInput(),
                const SizedBox(height: 20),
                _buildGenerateButton(homeProvider),
              ],

              // Show loading indicator if the image is being generated
              if (homeProvider.isLoading) ...[
                _buildLoadingIndicator(),
              ],

              // Show the generated image and regenerate button if an image is available
              if (homeProvider.generatedImageFile != null) ...[
                _buildGeneratedImage(homeProvider),
                const SizedBox(height: 20),
                _buildRegenerateButton(homeProvider), // New regenerate button
              ],

              // Feature buttons will always be visible
              _buildFeatureButtons(context, homeProvider),

              // Show debug message if there is one
              if (homeProvider.debugMessage.isNotEmpty) ...[
                const SizedBox(height: 10),
                Text(
                  homeProvider.debugMessage,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPromptInput() {
    return TextField(
      controller: _promptController,
      decoration: InputDecoration(
        hintText: "Please Describe Your Desired Artwork Here",
        filled: true,
        fillColor: const Color(0xFF293651),
        hintStyle: TextStyle(color: Colors.grey[400]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      maxLines: 3,
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildGenerateButton(HomeProvider homeProvider) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => homeProvider.generateImage(_promptController.text.trim()),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4F5DBF),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          "Generate",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildRegenerateButton(HomeProvider homeProvider) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          homeProvider.clearState(); // Clear the current image
          _promptController.clear(); // Clear the text input
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4F5DBF),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          "Generate Again",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: Column(
        children: [
          const CircularProgressIndicator(color: Colors.orange),
          const SizedBox(height: 20),
          Text(
            "Generating Image...",
            style: TextStyle(color: Colors.grey[400], fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildGeneratedImage(HomeProvider homeProvider) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.file(
              homeProvider.generatedImageFile!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureButtons(BuildContext context, HomeProvider homeProvider) {
    return Column(
      children: [
        _buildFeatureButton("Crop Image", Icons.crop, () {
          if (homeProvider.generatedImageFile != null) {
            _navigateToScreen(context, CropImageScreen(imageFile: homeProvider.generatedImageFile!));
          }
        }),
        _buildFeatureButton("Compress Image", Icons.compress, () {
          if (homeProvider.generatedImageFile != null) {
            _navigateToScreen(context, CompressImageScreen(imageFile: homeProvider.generatedImageFile!));
          }
        }),
        _buildFeatureButton("Adjust Image", Icons.tune, () {
          if (homeProvider.generatedImageFile != null) {
            _navigateToScreen(context, AdjustScreen(imageFile: homeProvider.generatedImageFile!));
          }
        }),
        _buildFeatureButton("Blur Image", Icons.blur_on, () {
          if (homeProvider.generatedImageFile != null) {
            _navigateToScreen(context, BlurScreen(imageFile: homeProvider.generatedImageFile!));
          }
        }),
        _buildFeatureButton("Frame Image", Icons.image, () {
          if (homeProvider.generatedImageFile != null) {
            _navigateToScreen(context, FramesScreen(imageFile: homeProvider.generatedImageFile!));
          }
        }),
        _buildFeatureButton("Draw on Image", Icons.brush, () {
          if (homeProvider.generatedImageFile != null) {
            _navigateToScreen(context, DrawScreen(imageFile: homeProvider.generatedImageFile!));
          }
        }),
        _buildFeatureButton("Add Stickers", Icons.sticky_note_2, () {
          if (homeProvider.generatedImageFile != null) {
            _navigateToScreen(context, StickerScreen(imageFile: homeProvider.generatedImageFile!));
          }
        }),
      ],
    );
  }

  Widget _buildFeatureButton(String label, IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4F5DBF),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          icon: Icon(icon, color: Colors.white),
          label: Text(label, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Constants/colors.dart';
import '../../Providers/languagesheet.dart';
import '../../Providers/translaterprovider.dart';

class TranslateScreen extends StatelessWidget {
  const TranslateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TranslateProvider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF0F172A), // Dark background

      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A), // Dark background

        title:  const Text(
        "Language Traslator",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Column(
          children: [
            // Input Text Field

          TextField(
            controller: provider.textC,
          decoration: InputDecoration(
            hintText: "Enter Text",
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
        ),

            const SizedBox(height: 16),

            // Language Selection Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LanguageSelector(
                  label: 'From',
                  selectedLanguage: provider.from,
                  onTap: () => _showLanguageSheet(context, provider, isFrom: true),
                ),
                Container(
                    width: 80,
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColors.buttonColor,
                        borderRadius: BorderRadius.circular(12)

                    ),
                    child: const Icon(Icons.swap_horiz,size: 25,)),
                LanguageSelector(
                  label: 'To',
                  selectedLanguage: provider.to,
                  onTap: () => _showLanguageSheet(context, provider, isFrom: false),
                ),
              ],
            ),
            const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => provider.googleTranslate(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4F5DBF),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Translate",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),

            // Translate Button

            const SizedBox(height: 16),

            // Show CircularProgressIndicator while loading
            if (provider.status == Status.loading)
              const CircularProgressIndicator(),

            const SizedBox(height: 16),


            // Result
            TextField(
              controller: provider.resultC,
              decoration: InputDecoration(
                hintText: "Translation Result",
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
            ),

          ],
        ),
      ),
    );
  }

  void _showLanguageSheet(BuildContext context, TranslateProvider provider, {required bool isFrom}) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return LanguageSheet(
          c: provider,
          selectedLanguage: ValueNotifier<String>(isFrom ? provider.from : provider.to),
          isFrom: isFrom,
        );
      },
    );
  }
}

class LanguageSelector extends StatelessWidget {
  final String label;
  final String selectedLanguage;
  final VoidCallback onTap;

  const LanguageSelector({
    super.key,
    required this.label,
    required this.selectedLanguage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 50,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
           color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(12)

        ),
        child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label),
            const SizedBox(width: 4),
            Text(selectedLanguage.isEmpty ? 'Select' : selectedLanguage),
          ],
        ),
      ),
    );
  }
}

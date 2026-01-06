import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:math';

class AIImageService {
  static const String _baseUrl = 'https://api.vyro.ai/v2/image/generations';
  final String apiKey = 'vk-DWlAt2JcG28hcBWjZXBLT9qP75JhyCMH8Q7SjKD39IhNFNT';

  Future<File> generateImage({
    required String prompt,
    String style = 'realistic',
    String aspectRatio = '1:1',
  }) async {
    final request = http.MultipartRequest('POST', Uri.parse(_baseUrl))
      ..headers['Authorization'] = 'Bearer $apiKey'
      ..fields['prompt'] = prompt
      ..fields['style'] = style
      ..fields['aspect_ratio'] = aspectRatio;

    final response = await request.send();

    if (response.statusCode == 200) {
      final bytes = await response.stream.toBytes();
      final file = File('${Directory.systemTemp.path}/design_${Random().nextInt(10000)}.png');
      await file.writeAsBytes(bytes);
      return file;
    } else {
      final errorBody = await response.stream.bytesToString();
      throw Exception('API Error ${response.statusCode}: $errorBody');
    }
  }
}
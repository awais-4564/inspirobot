import 'package:translator/translator.dart';

class APIs {
  static final translator = GoogleTranslator();

  static Future<String> googleTranslate({
    required String from,
    required String to,
    required String text,
  }) async {
    try {
      final translation = await translator.translate(text, from: from, to: to);
      return translation.text;
    } catch (e) {
      return 'Error: $e';
    }
  }
}
